import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_store/core/helpers/btn_sheet.dart';
import 'package:mo_store/core/widgets/custom_button.dart';
import 'package:mo_store/features/admin/data/models/categories/add_category_request.dart';
import 'package:mo_store/features/home/logic/categories_cubit/categories_cubit.dart';

class CreateNewCategoryButton extends StatelessWidget {
  const CreateNewCategoryButton({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        AppFunctions.addShowBtmSheet(
          context: context,
          controller: controller,
          title: 'Create New Category',
          lable: 'Category Name',
          buttonText: 'Save',
          sheetIcon: Icons.abc_sharp,
          prefixIcon: Icons.ad_units,
          onPressedbutton: () {
            BlocProvider.of<CategoriesCubit>(context).addCategory(
              AddCategoriesRequest(
                name: controller.text.trim(),
                image: 'https://placeimg.com/640/480/any',
              ),
            );
            BlocProvider.of<CategoriesCubit>(context).getCategories();
          },
          onTapSheetIcon: () {},
        );
      },
      text: 'Create New Category',
      width: double.infinity,
      height: 55,
    );
  }
}
