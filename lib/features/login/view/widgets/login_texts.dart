import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';

class LoginTexts extends StatelessWidget {
  const LoginTexts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.lightBlue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.r),
          bottomRight: Radius.circular(50.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              'Login',
              style: AppFonts.bold60Primary,
            ),
          ),
          20.verticalSpace,
          //^ text good to see you
          Text(
            'Good to see you back ❤',
            style: AppFonts.regular20Primary,
          ),
        ],
      ),
    );
  }
}
