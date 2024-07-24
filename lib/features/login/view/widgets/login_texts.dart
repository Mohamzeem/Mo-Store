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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              Text(
                'Good to see you back!',
                style: AppFonts.regular20Primary,
              ),
              5.horizontalSpace,
              SvgPicture.asset(
                'assets/images/svgs/heart.svg',
                colorFilter: const ColorFilter.mode(
                    AppColors.primaryColor, BlendMode.srcIn),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
