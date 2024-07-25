import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/core/widgets/auth_email_pass_fields.dart';
import 'package:mo_store/core/widgets/auth_two_btns.dart';
import 'package:mo_store/core/widgets/auth_waves.dart';
import 'package:mo_store/core/widgets/custom_txt_fom_field.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.lightBlue,
      ),
    );
    return Scaffold(
      //^ bottom wave
      bottomNavigationBar: AuthWaves.bottomWave(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //^ top wave
            AuthWaves.topWave(),
            20.verticalSpace,
            //^ create account text
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                'Create\nAccount',
                style: AppFonts.bold60Primary,
              ),
            ),
            20.verticalSpace,
            //^ upload photo
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SvgPicture.asset(
                'assets/images/svgs/Upload Photo.svg',
                colorFilter: const ColorFilter.mode(
                    AppColors.lightBlue, BlendMode.srcIn),
                height: 120.h,
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
            //^ email and password
            const AuthEmailAndPasswordFields(
              emailabel: 'Email',
              passwordLabel: 'Password',
              emailKeyBoard: TextInputType.name,
              passwordKeyBoard: TextInputType.visiblePassword,
            ),
            50.verticalSpace,
            AuthTwoButtons(text: 'Create Account', onPressed: () {})
          ],
        ),
      ),
    );
  }
}
