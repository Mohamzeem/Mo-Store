import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ProfileShimmer extends StatelessWidget {
  final double? height, width;
  final bool isCircle;
  const ProfileShimmer({
    super.key,
    this.height,
    this.width,
    this.isCircle = true,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.lightBlue,
      highlightColor: AppColors.lightGrey,
      child: Container(
        height: 150.h,
        width: 150.w,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: isCircle ? null : BorderRadius.circular(100.r),
          border: Border.all(
            width: 1,
            color: AppColors.bordersGrey,
          ),
          color: AppColors.lightBlue.withOpacity(0.4),
        ),
      ),
    );
  }
}
