import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/features/home/view/widgets/home_cached_image.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
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
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: const HomeCachedNetworkImage(
              photoUrl: '',
              width: double.infinity,
              height: 110,
              shape: BoxShape.rectangle,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Product Name asdasdasd',
                  style: AppFonts.medium18White.copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text('100 \$', style: AppFonts.medium18White),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
