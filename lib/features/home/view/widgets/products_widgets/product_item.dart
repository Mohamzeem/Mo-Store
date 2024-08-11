import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/features/home/data/models/products_response.dart';
import 'package:mo_store/features/home/view/widgets/home_cached_image.dart';

class ProductItem extends StatelessWidget {
  final ProductsResponseBody product;
  const ProductItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.lightBlue,
            AppColors.lightBlue,
            AppColors.darkBlue.withOpacity(0.7),
            AppColors.darkBlue.withOpacity(0.9),
          ],
        ),
        color: AppColors.bordersGrey,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
            //^ share and favorite
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.share,
                    size: 25.r,
                    color: AppColors.white,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.favorite,
                    size: 25.r,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: HomeCachedNetworkImage(
              photoUrl:
                  product.images!.first.replaceAll(RegExp(r'[\[\]]^"'), ''),
              width: double.infinity,
              height: 110,
              shape: BoxShape.rectangle,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  product.title!,
                  style: AppFonts.medium18White.copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text('${product.price} \$', style: AppFonts.medium18White),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
