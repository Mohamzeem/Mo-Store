import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/features/home/data/models/products_response.dart';

class PriceAndShare extends StatelessWidget {
  const PriceAndShare({
    super.key,
    required this.product,
  });

  final ProductsResponseBody product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 320.w,
          child: Text(
            '${product.price!.toString()} \$',
            style: AppFonts.medium30Primary.copyWith(fontSize: 30.sp),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Icon(
          Icons.share,
          color: AppColors.lightBlue,
          size: 28.r,
        ),
      ],
    );
  }
}
