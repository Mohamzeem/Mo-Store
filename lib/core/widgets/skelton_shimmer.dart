import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class SkeltonShimmer extends StatelessWidget {
  final double? height, width;
  final BoxShape shape;
  final bool? isBorder;
  final Color? color;
  final double? borderRadius;
  const SkeltonShimmer({
    super.key,
    this.height,
    this.width,
    this.shape = BoxShape.circle,
    this.isBorder = true,
    this.color,
    this.borderRadius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: color ?? AppColors.lightBlue,
      highlightColor: AppColors.lightGrey,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: shape,
          border: isBorder!
              ? Border.all(
                  width: 1,
                  color: AppColors.bordersGrey,
                )
              : Border.all(width: 0, color: Colors.transparent),
          color: AppColors.lightBlue.withOpacity(0.4),
          borderRadius: BorderRadius.circular(borderRadius!.r),
        ),
      ),
    );
  }
}
