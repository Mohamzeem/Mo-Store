import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_store/core/widgets/custom_dialog.dart';
import 'package:mo_store/features/admin/view/admin/widegts/admin_app_bar.dart';
import 'package:mo_store/features/admin/view/categories/widgets/all_categ_text_search.dart';
import 'package:mo_store/features/admin/view/categories/widgets/all_categories_list.dart';
import 'package:mo_store/features/admin/view/categories/widgets/create_new_categ_btn.dart';
import 'package:mo_store/features/home/logic/categories_cubit/categories_cubit.dart';
import 'package:mo_store/features/home/logic/categories_cubit/categories_state.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    final categoriesCubit = BlocProvider.of<CategoriesCubit>(context);

    return Scaffold(
      //^ create new category button
      bottomNavigationBar: BlocListener<CategoriesCubit, CategoriesState>(
        listener: (context, state) {
          state.maybeWhen(
            successAddCategories: () {
              categoriesCubit.getCategories();
              CustomDialog.awsomeSuccess(
                context,
                'Category Created Successfully',
                (dismiss) {},
              );
              categoriesCubit.controller.clear();
            },
            failureAddCategories: (message) => CustomDialog.awsomeError(
              context,
              message.toString(),
            ),
            orElse: () {},
          );
        },
        child: const CreateNewCategoryButton(),
      ),
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
