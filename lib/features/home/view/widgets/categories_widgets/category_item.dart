import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/features/home/view/widgets/home_cached_image.dart';

class CategoryItem extends StatelessWidget {
  final int index;
  const CategoryItem({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: index == 0 ? 0 : 10.w),
      child: Column(
        children: [
          Container(
            height: 66.h,
            width: 66.w,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: AppColors.redAccent,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: const HomeCachedNetworkImage(
              photoUrl: '',
              width: 66,
              height: 66,
            ),
          ),
          SizedBox(
            width: 60.w,
            child: Text(
              'tesasdasdasdast',
              style: AppFonts.regular18LightBlue,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
