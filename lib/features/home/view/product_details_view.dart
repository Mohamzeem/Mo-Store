import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/core/widgets/custom_app_bar.dart';
import 'package:mo_store/features/home/data/models/products_response.dart';
import 'package:mo_store/features/home/view/widgets/product_details_widgets/add_cart_favorit.dart';
import 'package:mo_store/features/home/view/widgets/product_details_widgets/price_share.dart';
import 'package:mo_store/features/home/view/widgets/product_details_widgets/product_details_images.dart';

class ProductDetailsView extends StatelessWidget {
  final ProductsResponseBody product;
  const ProductDetailsView({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AddToCartAndFavorit(product: product),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                title: product.title!,
                isArrowBack: true,
                style: AppFonts.medium30Primary.copyWith(fontSize: 25.sp),
              ),
              20.verticalSpace,
              ProductDetailsImages(product: product),
              30.verticalSpace,
              PriceAndShare(product: product),
              20.verticalSpace,
              //^ description
              Text(
                product.description!,
                style: AppFonts.medium18Primary,
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
