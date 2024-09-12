// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/core/widgets/skelton_shimmer.dart';

class DashboardContainer extends StatelessWidget {
  final String title;
  final String number;
  final String image;
  final bool isLoading;
  const DashboardContainer({
    super.key,
    required this.title,
    required this.number,
    required this.image,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      height: 160.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
        gradient: LinearGradient(
          colors: [
            AppColors.lightBlue,
            AppColors.darkBlue.withOpacity(0.5),
            AppColors.darkBlue.withOpacity(0.7),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: AppFonts.medium24White
                      .copyWith(fontSize: 30.sp, fontWeight: FontWeight.bold),
                ),
                isLoading
                    ? const SkeltonShimmer(
                        height: 30,
                        width: 100,
                        shape: BoxShape.rectangle,
                        color: AppColors.black,
                        isBorder: false,
                      )
                    : Text(
                        number,
                        style: AppFonts.medium24White.copyWith(fontSize: 35.sp),
                      ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            child: Image.asset(image),
          )
        ],
      ),
    );
  }
}
