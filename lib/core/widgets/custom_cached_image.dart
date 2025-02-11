import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/extensions.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/core/widgets/custom_circular_loading.dart';

class CustomCachedImage extends StatelessWidget {
  final String photoUrl;
  final Widget? child;
  final double width;
  final double height;
  final double border;
  final BoxFit fit;
  final BoxShape shape;
  final bool? isBorder;
  final double loadingCircle;
  final Color loadingColor;
  const CustomCachedImage({
    super.key,
    required this.photoUrl,
    this.child = const SizedBox.shrink(),
    required this.width,
    required this.height,
    this.shape = BoxShape.circle,
    this.fit = BoxFit.fill,
    this.isBorder = true,
    this.loadingCircle = 30,
    this.border = 0,
    this.loadingColor = AppColors.lightBlue,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CachedNetworkImage(
        imageUrl: photoUrl.isNullOrEmptyString()
            ? 'https://via.placeholder.com/300'
            : photoUrl,
        fit: BoxFit.fill,
        imageBuilder: (context, imageProvider) => Container(
          width: width.w,
          height: height.h,
          decoration: BoxDecoration(
            shape: shape,
            borderRadius: BorderRadius.circular(border.r),
            border: isBorder!
                ? Border.all(
                    width: 1,
                    color: AppColors.bordersGrey,
                  )
                : Border.all(width: border, color: Colors.transparent),
            image: DecorationImage(
              image: imageProvider,
              fit: fit,
            ),
          ),
          child: child,
        ),
        progressIndicatorBuilder: (context, url, progress) =>
            CustomCircularLoading(
          height: loadingCircle.h,
          width: loadingCircle.w,
          color: loadingColor,
        ),
        errorWidget: (context, url, error) => Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: AppColors.lightBlue.withOpacity(0.3),
              borderRadius: BorderRadius.circular(border.r)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Something went wrong',
                style: AppFonts.medium18Primary,
                textAlign: TextAlign.center,
              ),
              Icon(
                Icons.error,
                color: AppColors.redAccent,
                size: loadingCircle.r,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
