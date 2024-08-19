import 'package:flutter/material.dart';
import 'package:mo_store/core/widgets/custom_app_bar.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          CustomAppBar(
              title: 'Product Details', isArrowBack: true, padding: 20),
        ],
      )),
    );
  }
}
