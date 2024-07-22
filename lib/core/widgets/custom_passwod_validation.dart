import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';

class CustomPasswordValidation extends StatelessWidget {
  final bool hasUpperCase;
  final bool hasLowerCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  const CustomPasswordValidation({
    super.key,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
    required this.hasLowerCase,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowercase letter', hasLowerCase),
        2.verticalSpace,
        buildValidationRow('At least 1 uppercase letter', hasUpperCase),
        2.verticalSpace,
        buildValidationRow(
            'At least 1 special character', hasSpecialCharacters),
        2.verticalSpace,
        buildValidationRow('At least 1 number', hasNumber),
        2.verticalSpace,
        buildValidationRow('At least 8 characters long', hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: AppColors.lightBlue,
        ),
        6.horizontalSpace,
        Text(
          text,
          // style: AppFonts.regular14Main.copyWith(
          //   decoration: !hasValidated ? TextDecoration.lineThrough : null,
          //   decorationColor: AppColors.kGrey,
          //   decorationThickness: 2,
          //   color: hasValidated ? AppColors.mainColor : AppColors.kGrey,
          // ),
        )
      ],
    );
  }
}
