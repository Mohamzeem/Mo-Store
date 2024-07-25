import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';

class AuthWaves {
  static Widget topWave() => ClipPath(
        clipper: WaveClipperTwo(),
        child: Container(
          height: 120.h,
          color: AppColors.lightBlue,
        ),
      );

  static Widget bottomWave() => ClipPath(
        clipper: WaveClipperTwo(reverse: true, flip: true),
        child: Container(
          height: 100.h,
          color: AppColors.lightBlue,
        ),
      );
}
