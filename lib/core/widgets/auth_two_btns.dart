import 'package:flutter/material.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/helpers/extensions.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/core/widgets/custom_button.dart';

class AuthTwoButtons extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  const AuthTwoButtons(
      {super.key,
      required this.text,
      required this.onPressed,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          onPressed: onPressed,
          text: text,
          width: 400,
          height: 55,
          textStyle: AppFonts.medium24White,
          isLoading: isLoading,
        ),
        10.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => context.pop(),
              child: CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.lightBlue,
                child: const Icon(
                  Icons.arrow_back_rounded,
                  color: AppColors.white,
                ),
              ),
            ),
            10.horizontalSpace,
            Text(
              'Cancel',
              style: AppFonts.regular20Primary,
            ),
          ],
        ),
      ],
    );
  }
}
