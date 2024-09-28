import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';

class CustomContainerIcon extends StatelessWidget {
  final double containerSize;
  final double iconSize;
  final Color containerColor;
  final Color iconColor;
  final IconData icon;
  const CustomContainerIcon({
    super.key,
    this.containerSize = 30,
    this.iconSize = 20,
    this.containerColor = AppColors.lightBlue,
    this.iconColor = AppColors.white,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerSize.h,
      width: containerSize.w,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppColors.lightBlue,
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize.r,
      ),
    );
  }
}
