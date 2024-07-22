import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/app/app_globals.dart';
import 'package:mo_store/core/consts/app_colors.dart';

class AppFonts {
  static TextStyle bold24White = TextStyle(
    fontSize: 60.sp,
    fontWeight: FontWeight.w700,
    fontFamily: AppGlobals.appFont,
    color: AppColors.white,
    height: 1,
  );

  static TextStyle regular18Primary = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    fontFamily: AppGlobals.appFont,
    color: AppColors.lightBlue,
  );

  static TextStyle medium24White = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.w400,
    fontFamily: AppGlobals.appFont,
    color: AppColors.white,
  );
}
