import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/widgets/custom_txt_fom_field.dart';

class AuthEmailAndPasswordFields extends StatelessWidget {
  final String? Function(String?)? emailValidator;
  final String? Function(String?)? passwordValidator;
  final String emailabel;
  final String passwordLabel;
  final TextInputType emailKeyBoard;
  final TextInputType passwordKeyBoard;
  const AuthEmailAndPasswordFields({
    super.key,
    required this.emailValidator,
    required this.passwordValidator,
    required this.emailabel,
    required this.passwordLabel,
    required this.emailKeyBoard,
    required this.passwordKeyBoard,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
