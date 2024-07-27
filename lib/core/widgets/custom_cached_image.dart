import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/extensions.dart';
import 'package:mo_store/core/widgets/custom_circular_loading.dart';

class CustomCachedImage extends StatelessWidget {
  final String photoUrl;
  final Widget? child;
  final double width;
  final double height;
  final BoxFit fit;
  final BoxShape shape;
  final bool? isBorder;
  const CustomCachedImage({
    super.key,
    required this.photoUrl,
    this.child = const SizedBox.shrink(),
    required this.width,
    required this.height,
    this.shape = BoxShape.circle,
    this.fit = BoxFit.fill,
    this.isBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CachedNetworkImage(
        imageUrl: photoUrl.isNullOrEmpty()
            ? 'https://via.placeholder.com/300'
            : photoUrl,
        fit: BoxFit.fill,
        imageBuilder: (context, imageProvider) => Container(
          width: width.w,
          height: height.h,
          decoration: BoxDecoration(
            shape: shape,
            border: isBorder!
                ? Border.all(
                    width: 0.5,
                    color: AppColors.primaryColor,
                  )
                : Border.all(width: 0, color: Colors.transparent),
            image: DecorationImage(
              image: imageProvider,
              fit: fit,
            ),
          ),
          child: child,
        ),
        progressIndicatorBuilder: (context, url, progress) =>
            const CustomCircularLoading(height: 30, width: 30),
        errorWidget: (context, url, error) => const Icon(
          Icons.error,
          size: 40,
          color: AppColors.redAccent,
        ),
      ),
    );
  }
}
