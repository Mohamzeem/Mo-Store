import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/widgets/auth_email_pass_fields.dart';
import 'package:mo_store/core/widgets/auth_waves.dart';
import 'package:mo_store/features/login/view/widgets/login_btn_with_cubit.dart';
import 'package:mo_store/features/login/view/widgets/login_texts.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
            //^ login text
            const LoginTexts(),
            //^ image
            Center(
              child: Image.asset('assets/images/pngs/shopping.png', scale: 2),
            ),
            20.verticalSpace,
            //^ email and password
            const AuthEmailAndPasswordFields(
              emailabel: 'Email',
              passwordLabel: 'Password',
              emailKeyBoard: TextInputType.name,
              passwordKeyBoard: TextInputType.visiblePassword,
            ),
            40.verticalSpace,
            const LoginButtonWithCubit(),
          ],
        ),
      ),
    );
  }
}
