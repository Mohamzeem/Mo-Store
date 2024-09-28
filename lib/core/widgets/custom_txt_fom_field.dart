import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final VoidCallback? suffixIconFunction;
  final bool suffixIconShow;
  final bool obscureText;
  final bool readOnly;
  final TextInputType keyBoard;
  final int maxLength;
  final int maxLines;
  final Color filled;
  final double height;
  final double padding;
  const CustomTextFormField({
    super.key,
    this.controller,
    required this.label,
    this.suffixIconFunction,
    this.suffixIconShow = false,
    this.obscureText = false,
    this.readOnly = false,
    required this.keyBoard,
    this.maxLength = 50,
    this.maxLines = 1,
    this.filled = AppColors.white,
    this.height = 55,
    this.padding = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding.w),
      child: SizedBox(
        height: height.h,
        child: TextFormField(
          controller: controller,
          readOnly: readOnly,
          keyboardType: keyBoard,
          inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
          cursorColor: AppColors.primaryColor,
          textInputAction: TextInputAction.done,
          obscureText: obscureText,
          maxLines: maxLines,
          style: TextStyle(
              fontSize: 20.sp,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w700),
          decoration: InputDecoration(
            suffixIcon: suffixIconShow
                ? InkWell(
                    onTap: suffixIconFunction,
                    child: obscureText
                        ? const Icon(
                            Icons.visibility_off,
                            color: AppColors.lightBlue,
                          )
                        : const Icon(
                            Icons.visibility,
                            color: AppColors.lightBlue,
                          ),
                  )
                : const SizedBox(),
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
