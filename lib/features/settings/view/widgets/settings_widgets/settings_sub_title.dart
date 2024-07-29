import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';

class SettingsSubTitle extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool visibleIcon;
  const SettingsSubTitle({
    super.key,
    required this.title,
    required this.icon,
    this.visibleIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppFonts.medium30Primary),
        visibleIcon
            ? Icon(icon, color: AppColors.primaryColor, size: 30.h)
            : const SizedBox.shrink(),
      ],
    );
  }
}
