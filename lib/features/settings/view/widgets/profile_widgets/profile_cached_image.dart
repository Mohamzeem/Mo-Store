import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';

class ProfileCachedImage extends StatelessWidget {
  final String photoUrl;
  final Widget? child;
  final double loadingCircle;
  final Color loadingColor;
  final bool isCircle;
  const ProfileCachedImage({
    super.key,
    required this.photoUrl,
    this.child = const SizedBox.shrink(),
    this.loadingCircle = 30,
    this.loadingColor = AppColors.lightBlue,
    this.isCircle = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 150.h,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: CachedNetworkImage(
        imageUrl: photoUrl,
        imageBuilder: (context, imageProvider) => Container(
          width: 150.w,
          height: 150.h,
          decoration: BoxDecoration(
            shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
            borderRadius: isCircle ? null : BorderRadius.circular(100.r),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.fill,
            ),
          ),
          child: child,
        ),
        // progressIndicatorBuilder: (context, url, progress) =>
        //     CustomCircularLoading(
        //   height: loadingCircle.h,
        //   width: loadingCircle.w,
        //   color: loadingColor,
        // ),
        errorWidget: (context, url, error) => const Icon(
          Icons.error,
          size: 150 / 2,
          color: AppColors.redAccent,
        ),
      ),
    );
  }
}
