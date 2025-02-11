import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';

class CustomCircularLoading extends StatelessWidget {
  final Color? color;
  final double height;
  final double width;
  final double? strokeWidth;
  const CustomCircularLoading({
    super.key,
    this.color,
    required this.height,
    required this.width,
    this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height.h,
        width: width.w,
        child: CircularProgressIndicator(
          color: color ?? AppColors.lightBlue,
          strokeWidth: strokeWidth ?? 5.h,
        ),
      ),
    );
  }
}
