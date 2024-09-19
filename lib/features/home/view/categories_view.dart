import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/helpers/prints.dart';
import 'package:mo_store/core/widgets/custom_app_bar.dart';
import 'package:mo_store/core/widgets/custom_circular_loading.dart';
import 'package:mo_store/features/home/data/models/categories_response.dart';
import 'package:mo_store/features/home/data/models/products_response.dart';
import 'package:mo_store/features/home/logic/products_cubit/products_cubit.dart';
import 'package:mo_store/features/home/logic/products_cubit/products_state.dart';
import 'package:mo_store/features/home/view/widgets/home_widgets/empty_error_container.dart';
import 'package:mo_store/features/home/view/widgets/products_widgets/product_item.dart';

class CategoriesView extends StatefulWidget {
  final ({
    CategoriesResponseBody category,
    List<ProductsResponseBody> allprodList
  }) categoryInfo;
  const CategoriesView({
    super.key,
    required this.categoryInfo,
  });

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  late ProductsCubit _cubit;
  @override
  void initState() {
    super.initState();

    _cubit = BlocProvider.of<ProductsCubit>(context);
    // _cubit.getProducts();
    _cubit.categoriesProducts(
      widget.categoryInfo.category.categoriesList,
      widget.categoryInfo.allprodList,
    );
    Prints.debug(
        message: 'categoryProductsList ${_cubit.categoryProductsList.length}');
    Prints.debug(
        message: 'allProductsList ${widget.categoryInfo.allprodList.length}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              CustomAppBar(
                title:
                    widget.categoryInfo.category.data!.categories.first.name!,
                isArrowBack: true,
              ),
              15.verticalSpace,
              BlocBuilder<ProductsCubit, ProductsState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => const SizedBox(),
                    successCategory: (categoryProducts) {
                      return Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          child: GridView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: categoryProducts.length,
                            semanticChildCount: 2,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10.h,
                              crossAxisSpacing: 10.w,
                              childAspectRatio: 0.9,
                            ),
                            itemBuilder: (context, index) {
                              final product = categoryProducts[index];
                              return ProductItem(product: product);
                            },
                          ),
                        ),
                      );
                    },
                    loadingCategory: () {
                      return const CustomCircularLoading(
                          height: 200, width: 200);
                    },
                    emptyCategory: () {
                      return const Expanded(
                          child: EmptyErrorContainer(
                              text: 'No Products in this category'));
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
