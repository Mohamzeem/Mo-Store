import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/helpers/prints.dart';
import 'package:mo_store/core/widgets/skelton_shimmer.dart';
import 'package:mo_store/features/home/logic/home_cubit/home_cubit.dart';
import 'package:mo_store/features/home/logic/home_cubit/home_state.dart';
import 'package:mo_store/features/home/view/widgets/categories_widgets/category_list.dart';
import 'package:mo_store/features/home/view/widgets/empty_error_container.dart';

class CategoriesWithCubit extends StatelessWidget {
  const CategoriesWithCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.maybeWhen(
          successCategories: (categories) {
            Prints.debug(message: 'Categories: ${categories.length}');
            return CategoryList(categories: categories);
          },
          loadingCategories: () => SizedBox(
            height: 100.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Column(
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
                        height: 25.h,
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          emptyCategories: () {
            return const EmptyErrorContainer(text: 'No Categories');
          },
          orElse: () =>
              const EmptyErrorContainer(text: 'Error While Loading Categories'),
        );
      },
    ));
  }
}
