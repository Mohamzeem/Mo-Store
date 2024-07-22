import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          200.verticalSpace,
          Center(
            child: Container(
              height: 150.h,
              width: 150.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                // color: AppColors.white,
              ),
              child: Image.asset(
                'assets/images/pngs/store.png',
                scale: 1.8,
              ),
            ),
          ),
          20.verticalSpace,
          Text(
            'Mo Store',
            style: AppFonts.bold24White,
          ),
        ],
      ),
    );
  }
}
