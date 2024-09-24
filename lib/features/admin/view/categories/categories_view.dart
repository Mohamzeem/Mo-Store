import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/btn_sheet.dart';
import 'package:mo_store/core/widgets/custom_button.dart';
import 'package:mo_store/core/widgets/custom_dialog.dart';
import 'package:mo_store/features/admin/view/admin/widegts/admin_app_bar.dart';
import 'package:mo_store/features/admin/view/categories/widgets/all_categ_text_search.dart';
import 'package:mo_store/features/admin/view/categories/widgets/all_categories_list.dart';
import 'package:mo_store/features/admin/view/categories/widgets/add_categ_btn_body.dart';
import 'package:mo_store/features/home/logic/categories_cubit/categories_cubit.dart';
import 'package:mo_store/features/home/logic/categories_cubit/categories_state.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    final categoriesCubit = BlocProvider.of<CategoriesCubit>(context);

    return Scaffold(
      key: categoriesCubit.scaffoldKey,
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
              // categoriesCubit.addCategoryController.clear();
            },
            failureAddCategories: (message) => CustomDialog.awsomeError(
              context,
              message.toString(),
            ),
            orElse: () {},
          );
        },
        child: CustomButton(
          onPressed: () => AppFunctions.addShowBtmSheet(
            context: context,
            body: const AddCategoryButtonSheetBody(),
          ),
          text: 'Create New Category',
          width: double.infinity,
          height: 55,
        ),
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
