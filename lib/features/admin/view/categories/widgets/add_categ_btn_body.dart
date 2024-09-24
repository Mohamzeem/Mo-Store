import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mo_store/core/app/app_injection.dart';
import 'package:mo_store/core/app/upload_image/logic/upload_image/upload_image_cubit.dart';
import 'package:mo_store/core/app/upload_image/logic/upload_image/upload_image_state.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/extensions.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/core/widgets/custom_button.dart';
import 'package:mo_store/core/widgets/custom_cached_image.dart';
import 'package:mo_store/core/widgets/custom_dialog.dart';
import 'package:mo_store/core/widgets/custom_txt_fom_field.dart';
import 'package:mo_store/core/widgets/skelton_shimmer.dart';
import 'package:mo_store/features/home/logic/categories_cubit/categories_cubit.dart';

class AddCategoryButtonSheetBody extends StatefulWidget {
  const AddCategoryButtonSheetBody({
    super.key,
  });

  @override
  State<AddCategoryButtonSheetBody> createState() =>
      _AddCategoryButtonSheetBodyState();
}

class _AddCategoryButtonSheetBodyState
    extends State<AddCategoryButtonSheetBody> {
  TextEditingController addCategoryController = TextEditingController();

  @override
  void dispose() {
    addCategoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final categoriesCubit = BlocProvider.of<CategoriesCubit>(context);

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
                    'Create New Category',
                    style: AppFonts.regular18LightBlue.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp,
                    ),
                  ),
                  InkWell(
                    onTap: () => uploadImageCubit.removeImage(),
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
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_a_photo_outlined,
                            size: 70.r,
                            color: AppColors.lightBlue,
                          ),
                          Text('Add Category Photo',
                              style: AppFonts.regular18LightBlue),
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
                label: 'Category Name',
                maxLength: 50,
                controller: addCategoryController,
                keyBoard: TextInputType.emailAddress,
                filled: AppColors.lightGrey,
              ),
              10.verticalSpace,
              CustomButton(
                padding: 0,
                text: 'Save',
                onPressed: () {
                  if (addCategoryController.text.isNullOrEmptyString() ||
                      uploadImageCubit.imageUrl.isNullOrEmptyString()) {
                    CustomDialog.show(
                        context: context,
                        text: 'Data Required',
                        isSuccess: false);
                  } else {
                    // categoriesCubit.addCategoryGraphQl(
                    //   image: uploadImageCubit.imageUrl,
                    //   name: addCategoryController.text.trim(),
                    // );
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
