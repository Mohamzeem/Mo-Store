import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/features/home/data/models/products_response.dart';
import 'package:mo_store/features/home/view/widgets/products_widgets/product_item.dart';

class ProductsList extends StatelessWidget {
  final List<ProductsResponseBody>? products;
  const ProductsList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products!.length < 6 ? products!.length : 6,
      semanticChildCount: 2,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 10.w,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, index) {
        final product = products![index];
        return ProductItem(product: product);
      },
    );
  }
}
