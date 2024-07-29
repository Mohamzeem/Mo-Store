import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double width;
  final double height;
  final double? threeRadius;
  final double? lastRadius;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final bool isLoading;
  final TextAlign? textAlign;
  final double? loadingWidth;
  final double? loadingHeight;
  final double padding;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.width,
    required this.height,
    this.threeRadius,
    this.lastRadius,
    this.backgroundColor = AppColors.lightBlue,
    this.textStyle,
    this.isLoading = false,
    this.textAlign,
    this.loadingWidth = 30,
    this.loadingHeight = 30,
    this.padding = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding.w),
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
          gradient: LinearGradient(
            colors: [
              AppColors.lightBlue,
              AppColors.lightBlue,
              AppColors.darkBlue.withOpacity(0.7),
              AppColors.darkBlue.withOpacity(0.9),
              // AppColors.lightBlue,
              // AppColors.lightBlue,
            ],
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(threeRadius ?? 16),
                topRight: Radius.circular(threeRadius ?? 16),
                bottomRight: Radius.circular(threeRadius ?? 16),
                bottomLeft: Radius.circular(lastRadius ?? 16),
              ),
            ),
            // fixedSize: Size(width.w, height.h),
          ),
          onPressed: onPressed,
          child: isLoading
              ? const CircularProgressIndicator(
                  color: AppColors.white,
                )
              : Text(
                  text,
                  style: textStyle ?? AppFonts.medium24White,
                ),
        ),
      ),
    );
  }
}
