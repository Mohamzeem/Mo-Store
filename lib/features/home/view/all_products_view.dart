import 'package:flutter/material.dart';
import 'package:mo_store/core/widgets/custom_app_bar.dart';
import 'package:mo_store/features/home/view/widgets/all_prodcuts_view_widgets/all_products_with_cubit.dart';

class AllProductsView extends StatelessWidget {
  const AllProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomAppBar(title: 'All Products', isArrowBack: true, padding: 20),
            AllProductsListWithCubit(),
          ],
        ),
      ),
    );
  }
}
