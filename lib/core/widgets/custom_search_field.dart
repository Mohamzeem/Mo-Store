import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';

class CustomSearchField extends StatelessWidget {
  final String label;
  final TextInputType keyBoard;
  final int maxLength;
  final Color filled;
  final double height;
  final double padding;
  final void Function(String)? onChanged;
  const CustomSearchField({
    super.key,
    required this.label,
    required this.keyBoard,
    this.maxLength = 50,
    this.filled = AppColors.white,
    this.height = 55,
    this.padding = 20,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding.w),
      child: SizedBox(
        height: height.h,
        child: TextFormField(
          keyboardType: keyBoard,
          inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
          cursorColor: AppColors.primaryColor,
          textInputAction: TextInputAction.done,
          maxLines: 1,
          onChanged: onChanged,
          style: TextStyle(
              fontSize: 20.sp,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w700),
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
            fillColor: AppColors.white,
            filled: true,
            label: Text(
              label,
              style: AppFonts.regular18LightBlue,
            ),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide(width: 0.5, color: AppColors.lightBlue)),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide(width: 0.5, color: AppColors.lightBlue)),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide(width: 0.5, color: AppColors.lightBlue)),
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide(width: 0.5, color: AppColors.redAccent)),
            focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide(width: 0.5, color: AppColors.redAccent)),
          ),
        ),
      ),
    );
  }
}
