import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';

class HomeScrolllButton extends StatelessWidget {
  final void Function() onTap;
  const HomeScrolllButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.lightBlue,
              AppColors.darkBlue.withOpacity(0.9),
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Image.asset(
              'assets/images/pngs/arrow-top.png',
              color: AppColors.white,
              height: 40.h,
              width: 40.w,
            ),
          ),
        ),
      ),
    );
  }
}
