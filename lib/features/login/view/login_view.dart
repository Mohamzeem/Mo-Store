import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/features/login/view/widgets/login_fields.dart';
import 'package:mo_store/features/login/view/widgets/login_btn_with_cubit.dart';
import 'package:mo_store/features/login/view/widgets/login_texts.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.lightBlue,
      ),
    );
    return Scaffold(
      // //^ bottom wave
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //^ login text
            const LoginTexts(),
            //^ image
            Center(
              child: Image.asset('assets/images/pngs/shopping.png', scale: 1.9),
            ),
            25.verticalSpace,
            //^ email and password
            const LoginFields(),
            40.verticalSpace,
            //^ login button
            const LoginButtonWithCubit(),
          ],
        ),
      ),
    );
  }
}
