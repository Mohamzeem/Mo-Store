import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/helpers/regex.dart';
import 'package:mo_store/core/widgets/auth_email_pass_fields.dart';
import 'package:mo_store/core/widgets/auth_two_btns.dart';
import 'package:mo_store/core/widgets/auth_waves.dart';
import 'package:mo_store/core/widgets/custom_dialog.dart';
import 'package:mo_store/features/login/logic/login/login_cubit.dart';
import 'package:mo_store/features/login/logic/login/login_state.dart';
import 'package:mo_store/features/login/view/widgets/login_texts.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
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
            60.verticalSpace,
            const LoginButtonWithCubit(),
          ],
        ),
      ),
    );
  }
}

class LoginButtonWithCubit extends StatelessWidget {
  const LoginButtonWithCubit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LoginCubit>(context);

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (lgoinResponse) {
            CustomDialog.show(context: context, text: 'Login Success');
          },
          failure: (message) {
            CustomDialog.show(
                context: context, text: message, isSuccess: false);
          },
        );
      },
      builder: (context, state) {
        return AuthTwoButtons(
          text: 'Login',
          onPressed: () {
            cubit.loginFunction(context);
          },
        );
      },
    );
  }
}
