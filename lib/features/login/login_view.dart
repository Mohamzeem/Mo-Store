import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/core/widgets/custom_button.dart';
import 'package:mo_store/core/widgets/custom_txt_fom_field.dart';

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
      body: Column(
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
              'Create\nAccount',
              style: AppFonts.bold24White,
            ),
          ),
          20.verticalSpace,
          //^ upload photo
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SvgPicture.asset(
                'assets/images/svgs/Upload Photo.svg',
                colorFilter: const ColorFilter.mode(
                    AppColors.lightBlue, BlendMode.srcIn),
                height: 120.h,
              ),
            ),
          ),
          20.verticalSpace,
          //^ user name
          CustomTextFormField(
            validator: (p0) {
              return null;
            },
            label: 'User Name',
            keyBoard: TextInputType.name,
          ),
          10.verticalSpace,
          //^ email
          CustomTextFormField(
            validator: (p0) {
              return null;
            },
            label: 'Email',
            keyBoard: TextInputType.name,
          ),
          10.verticalSpace,
          //^ password
          CustomTextFormField(
            validator: (p0) {
              return null;
            },
            label: 'Password',
            keyBoard: TextInputType.name,
          ),
          40.verticalSpace,
          CustomButton(
            onPressed: () {},
            text: 'Create Account',
            width: 400,
            height: 55,
            textStyle: AppFonts.medium24White,
          ),
        ],
      ),
    );
  }
}
