import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/extensions.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/core/widgets/custom_cached_image.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final String photoUrl;
  final bool isArrowBack;
  final bool isAPhoto;

  const CustomAppBar({
    super.key,
    required this.title,
    this.isAPhoto = false,
    required this.photoUrl,
    this.isArrowBack = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isArrowBack
            ? Container(
                height: 40.h,
                width: 40.w,
                decoration: const BoxDecoration(
                  color: AppColors.lightBlue,
                  shape: BoxShape.circle,
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
            : SizedBox(
                width: 220.w,
                child: Text(
                  title,
                  style: AppFonts.appBarTitle,
                ),
              ),
        isAPhoto
            ? CustomCachedImage(
                height: 50,
                width: 50,
                photoUrl: photoUrl,
              )
            : SizedBox(height: 50.h, width: 50.w),
      ],
    );
  }
}
