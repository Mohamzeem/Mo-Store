import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';

class SettingsItem extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final TextStyle? textStyle;
  const SettingsItem({
    super.key,
    this.onTap,
    required this.title,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60.h,
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 0.5, color: AppColors.primaryColor.withOpacity(0.2))),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: textStyle ?? AppFonts.regular20Primary,
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColors.primaryColor,
              size: 22,
            )
          ],
        ),
      ),
    );
  }
}
