// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/extensions.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/core/route/routes.dart';
import 'package:mo_store/features/home/data/models/products_response.dart';

class HomeSearchBar extends StatelessWidget {
  final List<ProductsResponseBody> allprodList;
  const HomeSearchBar({
    super.key,
    required this.allprodList,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 40.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Search Products',
              style: AppFonts.medium30Primary
                  .copyWith(fontSize: 25.sp, fontWeight: FontWeight.w600),
            ),
            Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
              ),
              child: InkWell(
                onTap: () => context.pushName(Routes.searchProductsView,
                    args: allprodList),
                child: const Center(
                  child: Icon(
                    Icons.search_rounded,
                    size: 30,
                    color: AppColors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
