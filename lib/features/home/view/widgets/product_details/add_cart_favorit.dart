import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/widgets/custom_button.dart';

class AddToCartAndFavorit extends StatelessWidget {
  const AddToCartAndFavorit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.favorite_border_outlined,
            color: AppColors.lightBlue,
            size: 35.h,
          ),
          CustomButton(
            onPressed: () {},
            text: 'Add to cart',
            width: 175.w,
            height: 50.h,
            padding: 0,
          )
        ],
      ),
    );
  }
}
