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
import 'package:mo_store/features/admin/view/products/widgets/add_prod_images.dart';
import 'package:mo_store/features/admin/view/products/widgets/categ_select.dart';
import 'package:mo_store/features/admin/view/products/widgets/update_prod_images.dart';
import 'package:mo_store/features/home/data/models/products_response.dart';
import 'package:mo_store/features/home/logic/products_cubit/products_cubit.dart';
import 'package:mo_store/features/home/logic/products_cubit/products_state.dart';

class UpdateProductButtonSheetBody extends StatefulWidget {
  final ProductsResponseBody prodModel;
  const UpdateProductButtonSheetBody({
    super.key,
    required this.prodModel,
  });

  @override
  State<UpdateProductButtonSheetBody> createState() =>
      _UpdateProductButtonSheetBodyState();
}

class _UpdateProductButtonSheetBodyState
    extends State<UpdateProductButtonSheetBody> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  late ProductsCubit _productsCubit;
  void _updateProductWithValidation() {
    final uploadImageCubit = BlocProvider.of<UploadImageCubit>(context);
    if (nameController.text.isNullOrEmptyString() &&
        uploadImageCubit.imageUrl.isNullOrEmptyString()) {
      CustomDialog.show(
        context: context,
        text: 'Nothing to update',
        isSuccess: false,
      );
    } else {
      //update function
    }
  }

  @override
  void initState() {
    super.initState();
    _productsCubit = BlocProvider.of<ProductsCubit>(context);
    nameController.text = widget.prodModel.title!;
    descriptionController.text = widget.prodModel.description!;
    priceController.text = widget.prodModel.price.toString();
    _productsCubit.selectedCategory = widget.prodModel.category!.name!;
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Text(
          'Update Product',
          style: AppFonts.regular18LightBlue.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 22.sp,
          ),
        ),
        10.verticalSpace,
        UpdateProductImages(prodModel: widget.prodModel),
        10.verticalSpace,
        CustomTextFormField(
          padding: 0,
          label: 'Product Name',
          maxLength: 50,
          controller: nameController,
          textStyle: AppFonts.medium18Primary,
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
          maxLength: 5000,
          textStyle: AppFonts.medium18Primary.copyWith(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CategorySelect(),
            SizedBox(
              width: 140.w,
              child: CustomTextFormField(
                padding: 0,
                textStyle: AppFonts.medium18Primary.copyWith(fontSize: 20.sp),
                height: 45,
                label: 'Product Price',
                maxLength: 50,
                controller: priceController,
                keyBoard: TextInputType.number,
                filled: AppColors.lightGrey,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ],
        ),
        10.verticalSpace,
        BlocConsumer<ProductsCubit, ProductsState>(
          listener: (context, state) {
            state.whenOrNull(
              successAddProduct: () {
                context.pop();
                _productsCubit.getProducts();
                CustomDialog.show(
                  context: context,
                  text: 'Product Updated Successfully',
                );
              },
              failureAddProduct: (message) => CustomDialog.awsomeError(
                context,
                message.toString(),
              ),
            );
          },
          builder: (context, state) {
            return CustomButton(
              padding: 0,
              text: 'Update Product',
              onPressed: () {
                // _addProductByValidation();
                // _productsCubit.addProductGraphql(
                //   title: 'product test',
                //   price: 11,
                //   description: 'asdasdasdasd',
                //   categoryId: 1,
                //   images: [''],
                // );
              },
              width: double.infinity,
              height: 45,
              threeRadius: 10,
              lastRadius: 10,
              backgroundColor: AppColors.lightBlue,
              isLoading: state.maybeWhen(
                orElse: () => false,
                loadingAddProduct: () => true,
              ),
            );
          },
        ),
      ],
    );
  }
}
