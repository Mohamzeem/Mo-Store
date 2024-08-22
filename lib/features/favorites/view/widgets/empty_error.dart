import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';

class EmptyAndError extends StatelessWidget {
  const EmptyAndError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 100.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'No Favorites',
              style: AppFonts.regular18LightBlue.copyWith(fontSize: 35.sp),
            ),
          ),
          Icon(
            Icons.favorite_border,
            color: AppColors.lightBlue,
            size: 100.r,
          ),
        ],
      ),
    );
  }
}
