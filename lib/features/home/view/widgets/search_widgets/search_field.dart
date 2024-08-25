import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';

class SearchField extends StatelessWidget {
  final bool closeSearch;
  final bool showIcon;
  final double width;
  final String lable;
  final TextEditingController controller;
  const SearchField({
    super.key,
    required this.width,
    this.closeSearch = false,
    this.showIcon = true,
    required this.lable,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      width: width.w,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        inputFormatters: [LengthLimitingTextInputFormatter(20)],
        cursorColor: AppColors.primaryColor,
        textInputAction: TextInputAction.done,
        maxLines: 1,
        style: TextStyle(
            fontSize: 20.sp,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w700),
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
          fillColor: AppColors.white,
          filled: true,
          label: Center(
            child: Text(
              lable,
              style: AppFonts.regular18LightBlue,
            ),
          ),
          border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(width: 0.5, color: AppColors.bordersGrey)),
          enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(width: 0.5, color: AppColors.bordersGrey)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(width: 0.5, color: AppColors.lightBlue)),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(width: 0.5, color: AppColors.redAccent)),
          focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(width: 0.5, color: AppColors.redAccent)),
        ),
      ),
    );
  }
}
