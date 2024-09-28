import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_store/core/app/app_injection.dart';
import 'package:mo_store/core/app/upload_image/logic/upload_image/upload_image_cubit.dart';
import 'package:mo_store/core/helpers/btn_sheet.dart';
import 'package:mo_store/core/widgets/custom_button.dart';
import 'package:mo_store/features/admin/view/admin/widegts/admin_app_bar.dart';
import 'package:mo_store/features/admin/view/categories/widgets/all_categories_list.dart';
import 'package:mo_store/features/admin/view/products/widgets/add_prod_btn_body.dart';
import 'package:mo_store/features/admin/view/products/widgets/all_prods_list.dart';
import 'package:mo_store/features/admin/view/products/widgets/all_prods_text_search.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //^ create new product button
      bottomNavigationBar: CustomButton(
        onPressed: () => AppFunctions.addShowBtmSheet(
          context: context,
          body: BlocProvider(
            create: (context) => di<UploadImageCubit>(),
            child: const AddProductButtonSheetBody(),
          ),
        ),
        text: 'Create New Product',
        width: double.infinity,
        height: 55,
      ),
      body: const SafeArea(
        child: Column(
          children: [
            AdminAppBar(title: 'Products', padding: 20),
            AllProductsTextAndSearch(),
            AllProductsList(),
          ],
        ),
      ),
    );
  }
}
