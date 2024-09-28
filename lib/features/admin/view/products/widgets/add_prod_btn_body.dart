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
import 'package:mo_store/features/home/logic/categories_cubit/categories_cubit.dart';
import 'package:mo_store/features/home/logic/products_cubit/products_cubit.dart';
import 'package:mo_store/features/home/logic/products_cubit/products_state.dart';

class AddProductButtonSheetBody extends StatefulWidget {
  const AddProductButtonSheetBody({
    super.key,
  });

  @override
  State<AddProductButtonSheetBody> createState() =>
      _AddProductButtonSheetBodyState();
}

class _AddProductButtonSheetBodyState extends State<AddProductButtonSheetBody> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  late ProductsCubit _productsCubit;

  @override
  void initState() {
    super.initState();
    _productsCubit = BlocProvider.of<ProductsCubit>(context);
  }

  @override
  void didChangeDependencies() {
    _productsCubit.selectedCategory = '';
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  String getCategoryId() {
    return BlocProvider.of<CategoriesCubit>(context)
        .allCategories
        .where((e) => e.name == _productsCubit.selectedCategory)
        .first
        .id
        .toString();
  }

  void _addProductByValidation() {
    if (BlocProvider.of<UploadImageCubit>(context)
        .imagesList
        .isNullOrEmptyList()) {
      CustomDialog.show(
        context: context,
        text: 'At least one Image Required',
        isSuccess: false,
      );
    } else if (nameController.text.isNullOrEmptyString() ||
        descriptionController.text.isNullOrEmptyString()) {
      CustomDialog.show(
        context: context,
        text: 'Name & Description Required',
        isSuccess: false,
      );
    } else if (priceController.text.isNullOrEmptyString() ||
        _productsCubit.selectedCategory.isNullOrEmptyString()) {
      CustomDialog.show(
        context: context,
        text: 'Price & Category Required',
        isSuccess: false,
      );
    } else {
      _productsCubit.addProductGraphql(
        title: nameController.text.trim(),
        price: double.parse(priceController.text.trim()),
        description: descriptionController.text.trim(),
        categoryId: double.parse(getCategoryId()),
        images: BlocProvider.of<UploadImageCubit>(context).imagesList,
      );
    }
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
        const AddProductImages(),
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
        BlocConsumer<ProductsCubit, ProductsState>(
          listener: (context, state) {
            state.whenOrNull(
              successAddProduct: () {
                context.pop();
                _productsCubit.getProducts();
                CustomDialog.show(
                  context: context,
                  text: 'Product Created Successfully',
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
              text: 'Add Product',
              onPressed: () {
                _addProductByValidation();
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
