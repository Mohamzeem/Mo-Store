import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/widgets/custom_txt_fom_field.dart';
import 'package:mo_store/features/register/logic/register/register_cubit.dart';

class RegisterFields extends StatefulWidget {
  const RegisterFields({
    super.key,
  });

  @override
  State<RegisterFields> createState() => _RegisterFieldsState();
}

class _RegisterFieldsState extends State<RegisterFields> {
  late RegisterCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<RegisterCubit>();
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
          //^ user name
          CustomTextFormField(
            controller: _cubit.nameController,
            label: 'User Name',
            keyBoard: TextInputType.name,
          ),
          10.verticalSpace,
          //^ email
          CustomTextFormField(
            controller: _cubit.emailController,
            label: 'Email',
            keyBoard: TextInputType.emailAddress,
          ),
          10.verticalSpace,
          //^ password
          CustomTextFormField(
            controller: _cubit.passwordController,
            label: 'Password',
            obscureText: _cubit.isObscure,
            keyBoard: TextInputType.visiblePassword,
            suffixIconShow: true,
            suffixIconFunction: () => setState(
              () => _cubit.isObscure = !_cubit.isObscure,
            ),
          ),
        ],
      ),
    );
  }
}
