import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/extensions.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/core/widgets/custom_button.dart';
import 'package:mo_store/core/widgets/custom_dialog.dart';
import 'package:mo_store/core/widgets/custom_txt_fom_field.dart';
import 'package:mo_store/features/admin/view/categories/widgets/add_prod_categ_image.dart';
import 'package:mo_store/features/admin/view/products/widgets/add_image.dart';
import 'package:mo_store/features/admin/view/products/widgets/categ_select.dart';
import 'package:mo_store/features/home/logic/categories_cubit/categories_cubit.dart';
import 'package:mo_store/features/home/logic/categories_cubit/categories_state.dart';

class AddProductButtonSheetBody extends StatefulWidget {
  const AddProductButtonSheetBody({
    super.key,
  });

  @override
  State<AddProductButtonSheetBody> createState() =>
      _AddProductButtonSheetBodyState();
}

class _AddProductButtonSheetBodyState extends State<AddProductButtonSheetBody> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    super.dispose();
  }

  void _addCategoryByValidation() {
    // if (addCategoryController.text.isNullOrEmptyString() ||
    //     BlocProvider.of<UploadImageCubit>(context)
    //         .imageUrl
    //         .isNullOrEmptyString()) {
    //   CustomDialog.show(
    //     context: context,
    //     text: 'Image & Name Required',
    //     isSuccess: false,
    //   );
    // } else {
    //   BlocProvider.of<CategoriesCubit>(context).addCategoryGraphQl(
    //     image: BlocProvider.of<UploadImageCubit>(context).imageUrl,
    //     name: addCategoryController.text.trim(),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Text(
          'Create New Product',
          style: AppFonts.regular18LightBlue.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 22.sp,
          ),
        ),
        10.verticalSpace,
        const AddImageTest(isCateg: true),
        5.verticalSpace,
        const AddImageTest(isCateg: true),
        5.verticalSpace,
        const AddImageTest(isCateg: true),
        10.verticalSpace,
        CustomTextFormField(
          padding: 0,
          label: 'Product Name',
          maxLength: 50,
          controller: nameController,
          keyBoard: TextInputType.text,
          filled: AppColors.lightGrey,
        ),
        10.verticalSpace,
        CustomTextFormField(
          padding: 0,
          label: 'Product Description',
          controller: descriptionController,
          keyBoard: TextInputType.text,
          filled: AppColors.lightGrey,
          maxLines: 4,
          height: 150,
          maxLength: 1000,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CategorySelect(),
            SizedBox(
              width: 140.w,
              child: CustomTextFormField(
                padding: 0,
                height: 45,
                label: 'Price (\$)',
                maxLength: 50,
                controller: priceController,
                keyBoard: TextInputType.number,
                filled: AppColors.lightGrey,
              ),
            ),
          ],
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
                  text: 'Product Created Successfully',
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
              text: 'Add Product',
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
