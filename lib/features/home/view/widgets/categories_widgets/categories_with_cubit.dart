// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mo_store/core/widgets/skelton_shimmer.dart';
import 'package:mo_store/features/home/data/models/products_response.dart';
import 'package:mo_store/features/home/logic/categories_cubit/categories_cubit.dart';
import 'package:mo_store/features/home/logic/categories_cubit/categories_state.dart';
import 'package:mo_store/features/home/view/widgets/categories_widgets/category_list.dart';
import 'package:mo_store/features/home/view/widgets/home_widgets/empty_error_container.dart';

class CategoriesWithCubit extends StatelessWidget {
  final List<ProductsResponseBody> allprodList;
  const CategoriesWithCubit({
    super.key,
    required this.allprodList,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        return state.maybeWhen(
          successCategories: (categories) {
            return CategoryList(
              categories: categories.categoriesList,
              allprodList: allprodList,
            );
          },
          loadingCategories: () => SizedBox(
            height: 100.h,
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 5.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: SkeltonShimmer(
                          width: 85.w,
                          height: 70.h,
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: SkeltonShimmer(
                          width: 85.w,
                          height: 20.h,
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          emptyCategories: () => Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: const EmptyErrorContainer(text: 'No Categories'),
          ),
          orElse: () {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child:
                  const EmptyErrorContainer(text: 'Error Loading Categories'),
            );
          },
        );
      },
    ));
  }
}
