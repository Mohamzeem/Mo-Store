import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/helpers/regex.dart';
import 'package:mo_store/core/widgets/custom_dialog.dart';
import 'package:mo_store/core/widgets/custom_txt_fom_field.dart';
import 'package:mo_store/features/login/logic/login/login_cubit.dart';

class AuthEmailAndPasswordFields extends StatefulWidget {
  final String emailabel;
  final String passwordLabel;
  final TextInputType emailKeyBoard;
  final TextInputType passwordKeyBoard;
  const AuthEmailAndPasswordFields({
    super.key,
    required this.emailabel,
    required this.passwordLabel,
    required this.emailKeyBoard,
    required this.passwordKeyBoard,
  });

  @override
  State<AuthEmailAndPasswordFields> createState() =>
      _AuthEmailAndPasswordFieldsState();
}

class _AuthEmailAndPasswordFieldsState
    extends State<AuthEmailAndPasswordFields> {
  late LoginCubit _cubit;
  bool isObscure = true;
  @override
  void initState() {
    super.initState();
    _cubit = context.read<LoginCubit>();
  }

  @override
  void dispose() {
    _cubit.disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          //^ email
          CustomTextFormField(
            controller: _cubit.emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return CustomDialog.show(
                    context: context, text: 'Email Required', isSuccess: false);
              } else if (!_cubit.emailController.text.contains('@')) {
                return 'Invalid Email';
              }
            },
            label: 'Email',
            keyBoard: TextInputType.name,
          ),
          10.verticalSpace,
          //^ password
          CustomTextFormField(
            controller: _cubit.passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password Required';
              } else if (!AppRegex.isPasswordValid(value)) {
                return 'Wrong Password';
              }
            },
            label: 'Password',
            obscureText: isObscure,
            keyBoard: TextInputType.visiblePassword,
            suffixIconShow: true,
            suffixIconFunction: () => setState(() => isObscure = !isObscure),
          ),
        ],
      ),
    );
  }
}
