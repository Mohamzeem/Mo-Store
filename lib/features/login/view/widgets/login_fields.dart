import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/widgets/custom_txt_fom_field.dart';
import 'package:mo_store/features/login/logic/login/login_cubit.dart';

class LoginFields extends StatefulWidget {
  const LoginFields({
    super.key,
  });

  @override
  State<LoginFields> createState() => _LoginFieldsState();
}

class _LoginFieldsState extends State<LoginFields> {
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
            label: 'Email',
            keyBoard: TextInputType.name,
          ),
          10.verticalSpace,
          //^ password
          CustomTextFormField(
            controller: _cubit.passwordController,
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
