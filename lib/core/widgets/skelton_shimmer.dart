import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class SkeltonShimmer extends StatelessWidget {
  final double? height, width;
  final BoxShape? shape;
  final int? border;
  const SkeltonShimmer({
    super.key,
    this.height,
    this.width,
    this.shape,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.lightBlue,
      highlightColor: AppColors.lightGrey,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            shape: shape ?? BoxShape.circle,
            color: AppColors.lightBlue.withOpacity(0.4),
            borderRadius: BorderRadius.circular(10.r)),
      ),
    );
  }
}
