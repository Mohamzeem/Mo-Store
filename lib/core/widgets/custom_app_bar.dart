import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/extensions.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool isArrowBack;
  final bool isAPhoto;

  const CustomAppBar({
    super.key,
    required this.title,
    this.isAPhoto = false,
    this.isArrowBack = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 220.w,
            child: Text(
              title,
              style: AppFonts.appBarTitle,
            ),
          ),
          isArrowBack
              ? Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    color: AppColors.lightBlue,
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  ),
                  child: InkWell(
                    onTap: () => context.pop(),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back,
                        size: 25,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
