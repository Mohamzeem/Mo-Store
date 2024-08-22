import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';

class CustomFavoiteIcon extends StatelessWidget {
  final bool isFavorite;
  final double size;
  final IconData icon;
  final Color color;
  final void Function()? onTap;
  const CustomFavoiteIcon({
    super.key,
    this.isFavorite = false,
    this.size = 35,
    this.onTap,
    this.color = AppColors.lightBlue,
    this.icon = Icons.favorite_border_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        isFavorite ? Icons.favorite : icon,
        color: color,
        size: size.r,
      ),
    );
  }
}
