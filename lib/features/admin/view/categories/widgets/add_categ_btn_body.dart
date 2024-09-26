import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/app/upload_image/logic/upload_image/upload_image_cubit.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/extensions.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/core/widgets/custom_button.dart';
import 'package:mo_store/core/widgets/custom_dialog.dart';
import 'package:mo_store/core/widgets/custom_txt_fom_field.dart';
import 'package:mo_store/features/admin/view/categories/widgets/add_prod_categ_image.dart';
import 'package:mo_store/features/home/logic/categories_cubit/categories_cubit.dart';
import 'package:mo_store/features/home/logic/categories_cubit/categories_state.dart';

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

  void _addCategoryByValidation() {
    if (addCategoryController.text.isNullOrEmptyString() ||
        BlocProvider.of<UploadImageCubit>(context)
            .imageUrl
            .isNullOrEmptyString()) {
      CustomDialog.show(
        context: context,
        text: 'Image & Name Required',
        isSuccess: false,
      );
    } else {
      BlocProvider.of<CategoriesCubit>(context).addCategoryGraphQl(
        image: BlocProvider.of<UploadImageCubit>(context).imageUrl,
        name: addCategoryController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Text(
          'Create New Category',
          style: AppFonts.regular18LightBlue.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 22.sp,
          ),
        ),
        10.verticalSpace,
        const AddproductAndCategoryImage(),
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
        BlocConsumer<CategoriesCubit, CategoriesState>(
          listener: (context, state) {
            state.whenOrNull(
              successAddCategories: () {
                context.pop();
                BlocProvider.of<CategoriesCubit>(context).getCategories();
                CustomDialog.show(
                  context: context,
                  text: 'Category Created Successfully',
                );
              },
              failureAddCategories: (message) => CustomDialog.awsomeError(
                context,
                message.toString(),
              ),
            );
          },
          builder: (context, state) {
            return CustomButton(
              padding: 0,
              text: 'Add Category',
              onPressed: () {
                _addCategoryByValidation();
              },
              width: double.infinity,
              height: 45,
              threeRadius: 10,
              lastRadius: 10,
              backgroundColor: AppColors.lightBlue,
              isLoading: state.maybeWhen(
                orElse: () => false,
                loadingAddCategories: () => true,
              ),
            );
          },
        ),
      ],
    );
  }
}
