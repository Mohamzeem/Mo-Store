// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mo_store/core/widgets/custom_circular_loading.dart';
// import 'package:mo_store/features/home/data/models/products_response.dart';
// import 'package:mo_store/features/home/logic/all_products_cubit/all_products_state.dart';
// import 'package:mo_store/features/home/view/widgets/products_widgets/product_item.dart';

// class AllProductsList extends StatelessWidget {
//   final List<ProductsResponseBody>? products;
//   final AllProductsState state;
//   final ScrollController scrollController;
//   const AllProductsList({
//     super.key,
//     required this.products,
//     required this.state,
//     required this.scrollController,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         GridView.builder(
//           controller: scrollController,
//           shrinkWrap: true,
//           padding: EdgeInsets.zero,
//           physics: const NeverScrollableScrollPhysics(),
//           itemCount: products!.length,
//           semanticChildCount: 2,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisSpacing: 10.h,
//             crossAxisSpacing: 10.w,
//             childAspectRatio: 0.9,
//           ),
//           itemBuilder: (context, index) {
//             final product = products![index];
//             return Column(
//               children: [ProductItem(product: product)],
//             );
//           },
//         ),
//         if (state.hasMore == true && state.list.isNotEmpty)
//           const Padding(
//             padding: EdgeInsets.all(8.0),
//             child: CustomCircularLoading(height: 30, width: 30),
//           ),
//       ],
//     );
//   }
// }
