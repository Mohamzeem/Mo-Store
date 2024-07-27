// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_store/core/consts/pref_keys.dart';
import 'package:mo_store/core/helpers/shared_prefs.dart';
import 'package:mo_store/core/widgets/custom_dialog.dart';
import 'package:mo_store/features/login/data/models/login_request.dart';
import 'package:mo_store/features/login/data/repo/login_repo.dart';
import 'package:mo_store/features/login/logic/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit({required this.loginRepo}) : super(const LoginState.initial());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
  }

  void login(String email, String password) async {
    emit(const LoginState.loading());
    final result = await loginRepo.login(LoginRequestModel(
        email: emailController.text.trim(),
        password: passwordController.text.trim()));
    result.when(
      success: (lgoinResponse) {
        //^ save token
        SharedPrefHelper.setSecuredString(
            PrefKeys.userToken, lgoinResponse.accessToken!);
        emit(LoginState.success(lgoinResponse));
      },
      failure: (message) => emit(LoginState.failure(message)),
    );
  }

  void loginFunction(BuildContext context) async {
    if (emailController.text.isEmpty) {
      return CustomDialog.show(
          context: context, text: 'Email Required', isSuccess: false);
    } else if (!emailController.text.contains('@')) {
      return CustomDialog.show(
          context: context, text: 'Invalid Email', isSuccess: false);
    } else if (passwordController.text.isEmpty) {
      return CustomDialog.show(
          context: context, text: 'Password Required', isSuccess: false);
    } else {
      login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
    }
  }
}
