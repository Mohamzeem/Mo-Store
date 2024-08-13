import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';

class Banners extends StatelessWidget {
  const Banners({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child: Column(
          children: [
            SizedBox(
              height: 160.h,
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Image.asset('assets/images/pngs/sale1.png'),
              ),
            ),
            2.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 7.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                5.horizontalSpace,
                Container(
                  height: 7.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                    color: AppColors.lightBlue,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
