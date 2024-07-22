import 'package:flutter/material.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class SkeltonShimmer extends StatelessWidget {
  final double? height, width;
  final BoxShape? shape;
  const SkeltonShimmer({
    super.key,
    this.height,
    this.width,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.lightBlue,
      highlightColor: AppColors.lightBlue,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: shape ?? BoxShape.circle,
          color: AppColors.lightBlue.withOpacity(0.4),
        ),
      ),
    );
  }
}
