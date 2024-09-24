import 'package:flutter/material.dart';
import 'package:mo_store/core/helpers/btn_sheet.dart';
import 'package:mo_store/core/widgets/custom_button.dart';
import 'package:mo_store/features/admin/view/admin/widegts/admin_app_bar.dart';
import 'package:mo_store/features/admin/view/categories/widgets/add_categ_btn_body.dart';
import 'package:mo_store/features/admin/view/categories/widgets/all_categ_text_search.dart';
import 'package:mo_store/features/admin/view/categories/widgets/all_categories_list.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //^ create new category button
      bottomNavigationBar: CustomButton(
        onPressed: () => AppFunctions.addShowBtmSheet(
          context: context,
          body: const AddCategoryButtonSheetBody(),
        ),
        text: 'Create New Category',
        width: double.infinity,
        height: 55,
      ),
      body: const SafeArea(
        child: const Column(
          children: [
            //^ app bar
            AdminAppBar(title: 'Categories', padding: 20),
            //^ all categories text and search
            AllCategoriesTextAndSearch(),
            AllCategoriesList(),
          ],
        ),
      ),
    );
  }
}
