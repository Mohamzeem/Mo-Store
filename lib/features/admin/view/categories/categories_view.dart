import 'package:flutter/material.dart';
import 'package:mo_store/features/admin/view/admin/widegts/admin_app_bar.dart';
import 'package:mo_store/features/admin/view/categories/widgets/all_categ_text_search.dart';
import 'package:mo_store/features/admin/view/categories/widgets/all_categories_list.dart';
import 'package:mo_store/features/admin/view/categories/widgets/create_new_categ_btn.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //^ create new category button
      bottomNavigationBar: CreateNewCategoryButton(controller: controller),
      body: const SafeArea(
        child: Column(
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
