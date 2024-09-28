import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/helpers/prints.dart';
import 'package:mo_store/core/widgets/skelton_shimmer.dart';
import 'package:mo_store/features/admin/view/categories/widgets/categories_container.dart';
import 'package:mo_store/features/home/logic/categories_cubit/categories_cubit.dart';
import 'package:mo_store/features/home/logic/categories_cubit/categories_state.dart';

class AllCategoriesList extends StatelessWidget {
  const AllCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        final list = BlocProvider.of<CategoriesCubit>(context).foundCategories;
        Prints.debug(message: 'foundCategories ${list.length}');
        return list.isEmpty
            ? state.maybeWhen(
                orElse: () => const SizedBox(),
                loadingCategories: () {
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: 20.w,
                              left: 20.w,
                              right: 20.w,
                            ),
                            child: const SkeltonShimmer(
                              height: 140,
                              width: double.infinity,
                              shape: BoxShape.rectangle,
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
                successCategories: (categories) => Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: ListView.builder(
                      itemCount: categories.categoriesList.length,
                      itemBuilder: (context, index) {
                        final categoriesModel =
                            categories.categoriesList[index];
                        return CategoryContainer(
                          categoriesModel: categoriesModel,
                        );
                      },
                    ),
                  ),
                ),
              )
            : state.maybeWhen(
                orElse: () => const SizedBox(),
                loadingSearchCategories: () {
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: 20.w,
                              left: 20.w,
                              right: 20.w,
                            ),
                            child: const SkeltonShimmer(
                              height: 140,
                              width: double.infinity,
                              shape: BoxShape.rectangle,
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
                successSearchCategories: (categories) => Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: ListView.builder(
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final categoriesModel = categories[index];
                        return CategoryContainer(
                            categoriesModel: categoriesModel);
                      },
                    ),
                  ),
                ),
              );
      },
    );
  }
}
