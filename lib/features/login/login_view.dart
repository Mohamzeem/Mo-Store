import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/core/widgets/auth_email_pass_fields.dart';
import 'package:mo_store/core/widgets/auth_two_btns.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //^ bottom wave
      bottomNavigationBar: ClipPath(
        clipper: WaveClipperTwo(reverse: true, flip: true),
        child: Container(
          height: 100.h,
          color: AppColors.lightBlue,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //^ top wave
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: 120.h,
                color: AppColors.lightBlue,
              ),
            ),
            20.verticalSpace,
            //^ create account text
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                'Login',
                style: AppFonts.bold60Primary,
              ),
            ),
            20.verticalSpace,
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
            20.verticalSpace,
            //^ email and password
            AuthEmailAndPasswordFields(
              emailValidator: (p0) {
                return null;
              },
              passwordValidator: (p0) {
                return null;
              },
              emailabel: 'Email',
              passwordLabel: 'Password',
              emailKeyBoard: TextInputType.name,
              passwordKeyBoard: TextInputType.visiblePassword,
            ),
            60.verticalSpace,
            AuthTwoButtons(text: 'Login', onPressed: () {})
          ],
        ),
      ),
    );
  }
}
