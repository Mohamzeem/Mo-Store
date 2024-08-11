import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/extensions.dart';
import 'package:mo_store/core/widgets/custom_circular_loading.dart';

class HomeCachedNetworkImage extends StatelessWidget {
  final String photoUrl;
  final Widget? child;
  final double width;
  final double height;
  final BoxFit fit;
  final BoxShape shape;
  final double loadingCircle;
  final Color loadingColor;
  const HomeCachedNetworkImage({
    super.key,
    required this.photoUrl,
    this.child = const SizedBox.shrink(),
    required this.width,
    required this.height,
    this.shape = BoxShape.circle,
    this.fit = BoxFit.fill,
    this.loadingCircle = 30,
    this.loadingColor = AppColors.lightBlue,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: photoUrl.isNullOrEmpty()
          ? 'https://via.placeholder.com/300'
          : photoUrl,
      fit: BoxFit.fill,
      imageBuilder: (context, imageProvider) => Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.r),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
          ),
        ),
      ),
      progressIndicatorBuilder: (context, url, progress) =>
          CustomCircularLoading(
        height: 30.h,
        width: 30.w,
        color: AppColors.lightBlue,
      ),
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        size: 66 / 2,
        color: AppColors.redAccent,
      ),
    );
  }
}
