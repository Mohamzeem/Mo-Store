import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/extensions.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/core/route/app_router.dart';
import 'package:mo_store/core/route/routes.dart';
import 'package:mo_store/core/widgets/custom_button.dart';

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
              height: 200.h,
              width: 200.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                // color: AppColors.white,
              ),
              child: Image.asset(
                'assets/images/pngs/store.png',
                scale: 1.8,
                color: AppColors.lightBlue,
              ),
            ),
          ),
          20.verticalSpace,
          Text(
            'Mo Store',
            style: AppFonts.bold50Primary,
          ),
          10.verticalSpace,
          Text(
            'All you need in one place',
            style: AppFonts.regular20Primary,
          ),
          Text(
            'for your online store',
            style: AppFonts.regular20Primary,
          ),
          const Spacer(),
          CustomButton(
            onPressed: () => context.pushName(Routes.registerView),
            text: 'Lets get started',
            width: double.infinity,
            height: 55,
          ),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account',
                style: AppFonts.regular20Primary,
              ),
              10.horizontalSpace,
              InkWell(
                onTap: () => context.pushName(Routes.loginView),
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundColor: AppColors.lightBlue,
                  child: const Icon(
                    Icons.arrow_forward_rounded,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
          70.verticalSpace,
        ],
      ),
    );
  }
}
