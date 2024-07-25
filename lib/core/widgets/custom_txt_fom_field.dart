import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String?) validator;
  final String label;
  final VoidCallback? suffixIconFunction;
  final bool suffixIconShow;
  final bool obscureText;
  final TextInputType keyBoard;
  final int maxLength;
  final Color filled;
  const CustomTextFormField({
    super.key,
    this.controller,
    required this.validator,
    required this.label,
    this.suffixIconFunction,
    this.suffixIconShow = false,
    this.obscureText = false,
    required this.keyBoard,
    this.maxLength = 50,
    this.filled = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SizedBox(
        height: 55.h,
        child: TextFormField(
          controller: controller,
          validator: (value) => validator(value),
          keyboardType: keyBoard,
          inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
          cursorColor: AppColors.primaryColor,
          textInputAction: TextInputAction.done,
          obscureText: obscureText,
          maxLines: 1,
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
                borderSide:
                    BorderSide(width: 0.5, color: AppColors.primaryColor)),
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide:
                    BorderSide(width: 0.5, color: AppColors.primaryColor)),
            focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide:
                    BorderSide(width: 0.5, color: AppColors.primaryColor)),
          ),
        ),
      ),
    );
  }
}
