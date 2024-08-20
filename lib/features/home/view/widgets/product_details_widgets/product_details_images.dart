import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/widgets/custom_cached_image.dart';
import 'package:mo_store/features/home/data/models/products_response.dart';

class ProductDetailsImages extends StatelessWidget {
  const ProductDetailsImages({
    super.key,
    required this.product,
  });

  final ProductsResponseBody product;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: product.images!
          .map(
            (e) => CustomCachedImage(
              photoUrl: e,
              width: 350.w,
              height: 300.h,
              shape: BoxShape.rectangle,
            ),
          )
          .toList(),
      options: CarouselOptions(
        height: 300.h,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        pageSnapping: true,
      ),
    );
  }
}
