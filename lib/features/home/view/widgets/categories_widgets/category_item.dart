// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/extensions.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/core/route/routes.dart';
import 'package:mo_store/features/home/data/models/categories_response.dart';
import 'package:mo_store/features/home/data/models/products_response.dart';
import 'package:mo_store/features/home/view/widgets/home_widgets/home_cached_image.dart';

class CategoryItem extends StatelessWidget {
  final int index;
  final ({
    CategoriesModel category,
    List<ProductsResponseBody> allprodList
  }) categoryInfo;

  const CategoryItem({
    super.key,
    required this.index,
    required this.categoryInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: index == 0 ? 0 : 10.w),
      child: InkWell(
        onTap: () =>
            context.pushName(Routes.categoriesView, args: categoryInfo),
        child: Column(
          children: [
            Container(
              height: 70.h,
              width: 85.w,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColors.redAccent,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: HomeCachedNetworkImage(
                photoUrl: categoryInfo.category.image!,
                width: 85,
                height: 70,
              ),
            ),
            SizedBox(
              width: 85.w,
              child: Text(
                categoryInfo.category.name!,
                style: AppFonts.regular16Primary,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
