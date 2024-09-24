import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/app/app_injection.dart';
import 'package:mo_store/core/app/upload_image/logic/upload_image/upload_image_cubit.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/extensions.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/core/widgets/custom_button.dart';
import 'package:mo_store/core/widgets/custom_dialog.dart';
import 'package:mo_store/core/widgets/custom_txt_fom_field.dart';
import 'package:mo_store/features/admin/view/categories/widgets/update_categ_image.dart';
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
  TextEditingController updateCategoryController = TextEditingController();

  @override
  void dispose() {
    updateCategoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoryCubit = BlocProvider.of<CategoriesCubit>(context);
    return BlocProvider(
      create: (context) => di<UploadImageCubit>(),
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            'Update Category',
            style: AppFonts.regular18LightBlue.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 22.sp,
            ),
          ),
          10.verticalSpace,
          UpdateCategoryImage(categoriesModel: widget.categoriesModel),
          10.verticalSpace,
          CustomTextFormField(
            padding: 0,
            label: widget.categoriesModel.name!,
            maxLength: 50,
            controller: updateCategoryController,
            keyBoard: TextInputType.emailAddress,
            filled: AppColors.lightGrey,
          ),
          10.verticalSpace,
          CustomButton(
            padding: 0,
            text: 'Save',
            onPressed: () {
              final uploadImageCubit =
                  BlocProvider.of<UploadImageCubit>(context);
              if (updateCategoryController.text.trim().isNullOrEmptyString() ||
                  uploadImageCubit.imageUrl.isNullOrEmptyString()) {
                CustomDialog.show(
                    context: context,
                    text: 'Nothing to update',
                    isSuccess: false);
              } else {
                categoryCubit.updateCategoryGraphQl(
                  categoryId: widget.categoriesModel.id!,
                  image: uploadImageCubit.imageUrl.isNullOrEmptyString()
                      ? widget.categoriesModel.image!
                      : uploadImageCubit.imageUrl,
                  name:
                      updateCategoryController.text.trim().isNullOrEmptyString()
                          ? widget.categoriesModel.name!
                          : updateCategoryController.text.trim(),
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
      ),
    );
  }
}
