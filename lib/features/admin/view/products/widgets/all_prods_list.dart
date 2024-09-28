import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/helpers/prints.dart';
import 'package:mo_store/core/widgets/skelton_shimmer.dart';
import 'package:mo_store/features/admin/view/products/widgets/product_container.dart';
import 'package:mo_store/features/home/logic/products_cubit/products_cubit.dart';
import 'package:mo_store/features/home/logic/products_cubit/products_state.dart';

class AllProductsList extends StatelessWidget {
  const AllProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        final list = BlocProvider.of<ProductsCubit>(context).foundProductsList;
        Prints.debug(message: 'foundProductsList ${list.length}');
        return list.isEmpty
            ? state.maybeWhen(
                orElse: () => const SizedBox(),
                loadingProducts: () {
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
                successProducts: (products) => Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final prodModel = products[index];
                        return ProductContainer(
                          productModel: prodModel,
                        );
                      },
                    ),
                  ),
                ),
              )
            : state.maybeWhen(
                orElse: () => const SizedBox(),
                loadingSearch: () {
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
                successSearch: (products) => Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final prodModel = products[index];
                        return ProductContainer(
                          productModel: prodModel,
                        );
                      },
                    ),
                  ),
                ),
              );
      },
    );
  }
}
