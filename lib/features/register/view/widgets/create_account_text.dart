import 'package:flutter/material.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';

class CreateAccountText extends StatelessWidget {
  const CreateAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.lightBlue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.r),
          bottomRight: Radius.circular(50.r),
        ),
      ),
      child: Center(
        child: Text(
          'Create\nAccount',
          style: AppFonts.bold60Primary,
        ),
      ),
    );
  }
}
