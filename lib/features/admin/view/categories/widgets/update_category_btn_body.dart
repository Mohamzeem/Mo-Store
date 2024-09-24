// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mo_store/core/app/app_injection.dart';
import 'package:mo_store/core/app/upload_image/logic/upload_image/upload_image_cubit.dart';
import 'package:mo_store/core/app/upload_image/logic/upload_image/upload_image_state.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/btn_sheet.dart';
import 'package:mo_store/core/helpers/extensions.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/core/widgets/custom_button.dart';
import 'package:mo_store/core/widgets/custom_cached_image.dart';
import 'package:mo_store/core/widgets/custom_container_icon.dart';
import 'package:mo_store/core/widgets/custom_dialog.dart';
import 'package:mo_store/core/widgets/custom_txt_fom_field.dart';
import 'package:mo_store/core/widgets/skelton_shimmer.dart';
import 'package:mo_store/features/home/data/models/categories_response.dart';
import 'package:mo_store/features/home/logic/categories_cubit/categories_cubit.dart';

class UpdateCategoryButtonSheetBody extends StatefulWidget {
  final CategoriesModel categoriesModel;
  const UpdateCategoryButtonSheetBody({
    super.key,
    required this.categoriesModel,
  });

  @override
  State<UpdateCategoryButtonSheetBody> createState() =>
      _UpdateCategoryButtonSheetBodyState();
}

class _UpdateCategoryButtonSheetBodyState
    extends State<UpdateCategoryButtonSheetBody> {
  @override
  void dispose() {
    BlocProvider.of<CategoriesCubit>(context)
        .updateCategoryController
        .dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoryCubit = BlocProvider.of<CategoriesCubit>(context);
    return BlocProvider(
      create: (context) => di<UploadImageCubit>(),
      child: BlocBuilder<UploadImageCubit, UploadImageState>(
        builder: (context, state) {
          final uploadImageCubit = BlocProvider.of<UploadImageCubit>(context);
          return ListView(
            shrinkWrap: true,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Update Category',
                    style: AppFonts.regular18LightBlue.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      uploadImageCubit.removeImage();
                    },
                    child: Icon(
                      Icons.close,
                      color: AppColors.lightBlue,
                      size: 30.r,
                    ),
                  ),
                ],
              ),
              10.verticalSpace,
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                height: 150,
                width: double.infinity,
                child: InkWell(
                  onTap: () => uploadImageCubit.uploadImage(
                    ImageSource.gallery,
                    context,
                  ),
                  child: state.maybeWhen(
                    orElse: () {
                      return Stack(
                        children: [
                          CustomCachedImage(
                            photoUrl: widget.categoriesModel.image!,
                            height: 150,
                            width: double.infinity,
                            shape: BoxShape.rectangle,
                            border: 20,
                          ),
                          Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: AppColors.black.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20.r),
                                shape: BoxShape.rectangle),
                            child: Center(
                              child: Icon(
                                Icons.add_a_photo_outlined,
                                size: 70.r,
                                color: AppColors.lightBlue,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    success: (image) {
                      return CustomCachedImage(
                        photoUrl: image,
                        height: 150,
                        width: double.infinity,
                        shape: BoxShape.rectangle,
                        border: 20,
                      );
                    },
                    loading: () => const SkeltonShimmer(
                      height: 150,
                      shape: BoxShape.rectangle,
                      width: double.infinity,
                      borderRadius: 20,
                    ),
                  ),
                ),
              ),
              10.verticalSpace,
              CustomTextFormField(
                padding: 0,
                label: widget.categoriesModel.name!,
                maxLength: 50,
                controller: categoryCubit.updateCategoryController,
                keyBoard: TextInputType.emailAddress,
                filled: AppColors.lightGrey,
              ),
              10.verticalSpace,
              CustomButton(
                padding: 0,
                text: 'Save',
                onPressed: () {
                  if (categoryCubit.updateCategoryController.text
                          .trim()
                          .isNullOrEmptyString() ||
                      uploadImageCubit.imageUrl.isNullOrEmptyString()) {
                    CustomDialog.show(
                        context: context,
                        text: 'Nothing to update',
                        isSuccess: false);
                  } else {
                    categoryCubit.updateCategoryGraphQl(
                      widget.categoriesModel.id!,
                      uploadImageCubit.imageUrl.isNullOrEmptyString()
                          ? widget.categoriesModel.image!
                          : uploadImageCubit.imageUrl,
                      categoryCubit.updateCategoryController.text
                              .trim()
                              .isNullOrEmptyString()
                          ? widget.categoriesModel.name!
                          : categoryCubit.updateCategoryController.text.trim(),
                    );
                  }
                },
                width: double.infinity,
                height: 45,
                threeRadius: 10,
                lastRadius: 10,
                backgroundColor: AppColors.lightBlue,
              ),
            ],
          );
        },
      ),
    );
  }
}
