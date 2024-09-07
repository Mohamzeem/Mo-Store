import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';

class EmptyErrorContainer extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  const EmptyErrorContainer({
    super.key,
    required this.text,
    this.height = 100,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(10.r),
      ),
      height: height.h,
      child: Center(
        child: Text(
          text,
          style: AppFonts.regular18LightBlue
              .copyWith(fontWeight: FontWeight.w600, fontSize: 26.sp),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
