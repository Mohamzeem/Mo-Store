import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';

class ProfileField extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? suffixIconFunction;

  final String initialValue;
  final bool isVisibleText;
  final bool showIcon;
  final int maxLength;
  final Color filled;
  const ProfileField({
    super.key,
    this.controller,
    this.suffixIconFunction,
    required this.initialValue,
    this.isVisibleText = true,
    this.showIcon = false,
    this.maxLength = 50,
    this.filled = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
        cursorColor: AppColors.primaryColor,
        textInputAction: TextInputAction.done,
        maxLines: 1,
        style: AppFonts.regular20Primary,
        decoration: InputDecoration(
          hintText: initialValue,
          hintStyle: isVisibleText
              ? AppFonts.regular20Primary
              : AppFonts.regular20lightGrey,
          // suffixIcon: showIcon
          //     ? const Icon(Icons.visibility_off, color: AppColors.lightBlue)
          //     : const SizedBox.shrink(),
          suffixIcon: showIcon
              ? InkWell(
                  onTap: suffixIconFunction,
                  child: !isVisibleText
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
          fillColor: AppColors.lightGrey,
          filled: true,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(width: 0.5, color: AppColors.white)),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(width: 0.5, color: AppColors.white)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(width: 0.5, color: AppColors.white)),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(width: 0.5, color: AppColors.white)),
          focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(width: 0.5, color: AppColors.white)),
        ),
      ),
    );
  }
}
