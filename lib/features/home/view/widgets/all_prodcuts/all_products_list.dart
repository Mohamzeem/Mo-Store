// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/widgets/custom_circular_loading.dart';
import 'package:mo_store/features/home/data/models/products_response.dart';
import 'package:mo_store/features/home/logic/all_products_cubit/all_products_cubit.dart';
import 'package:mo_store/features/home/view/widgets/products_widgets/product_item.dart';

class AllProductsList extends StatelessWidget {
  final List<ProductsResponseBody>? products;
  final AllProductsCubit cubit;
  const AllProductsList({
    super.key,
    required this.products,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: cubit.scrollController,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products!.length,
      semanticChildCount: 2,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 10.w,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, index) {
        final product = products![index];
        // return ProductItem(product: product);
        return Column(
          children: [
            ProductItem(product: product),
            // if (index == products!.length - 1 && cubit.isLoading)
            // CustomCircularLoading(height: 20, width: 20)
          ],
        );
      },
    );
  }
}
