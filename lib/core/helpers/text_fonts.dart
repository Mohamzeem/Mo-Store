import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/app/app_globals.dart';
import 'package:mo_store/core/consts/app_colors.dart';

class AppFonts {
  static TextStyle bold60Primary = TextStyle(
    fontSize: 60.sp,
    fontWeight: FontWeight.w700,
    fontFamily: AppGlobals.appFont,
    color: AppColors.primaryColor,
    height: 1,
  );
  static TextStyle bold50Primary = TextStyle(
    fontSize: 50.sp,
    fontWeight: FontWeight.w700,
    fontFamily: AppGlobals.appFont,
    color: AppColors.primaryColor,
    height: 1,
  );
  static TextStyle medium30Primary = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    fontFamily: AppGlobals.appFont,
    color: AppColors.primaryColor,
    height: 1,
  );
  static TextStyle appBarTitle = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.w700,
    fontFamily: AppGlobals.appFont,
    color: AppColors.primaryColor,
  );
  static TextStyle regular18LightBlue = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    fontFamily: AppGlobals.appFont,
    color: AppColors.lightBlue,
  );
  static TextStyle regular20Primary = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    fontFamily: AppGlobals.appFont,
    color: AppColors.primaryColor,
  );

  static TextStyle regular20lightGrey = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    fontFamily: AppGlobals.appFont,
    color: AppColors.lightGrey,
  );
  static TextStyle medium24White = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
    fontFamily: AppGlobals.appFont,
    color: AppColors.white,
  );
  static TextStyle medium18White = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeight.w500,
    fontFamily: AppGlobals.appFont,
    color: AppColors.white,
  );
}
