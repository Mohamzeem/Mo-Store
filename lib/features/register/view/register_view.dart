import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/features/register/view/widgets/create_account_text.dart';
import 'package:mo_store/features/register/view/widgets/register_btn_with_cubit.dart';
import 'package:mo_store/features/register/view/widgets/register_fields.dart';
import 'package:mo_store/features/register/view/widgets/register_image.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.lightBlue,
      ),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //^ create account text
            const CreateAccountText(),
            30.verticalSpace,
            //^ upload photo
            const RegisterImage(),
            30.verticalSpace,
            //^ email and password
            const RegisterFields(),
            50.verticalSpace,
            const RegisterButtonWithCubit()
          ],
        ),
      ),
    );
  }
}
