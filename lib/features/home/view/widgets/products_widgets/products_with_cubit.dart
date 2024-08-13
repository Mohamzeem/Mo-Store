import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/widgets/skelton_shimmer.dart';
import 'package:mo_store/features/home/logic/products_cubit/products_cubit.dart';
import 'package:mo_store/features/home/logic/products_cubit/products_state.dart';
import 'package:mo_store/features/home/view/widgets/home_widgets/empty_error_container.dart';
import 'package:mo_store/features/home/view/widgets/products_widgets/products_list.dart';

class ProductsListWithCubit extends StatelessWidget {
  const ProductsListWithCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          return state.maybeWhen(
            successProducts: (products) => ProductsList(products: products),
            emptyProducts: () {
              return EmptyErrorContainer(
                text: 'No Products',
                height: 320.h,
              );
            },
            loadingProducts: () {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Center(
                    child: GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  semanticChildCount: 2,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.h,
                    crossAxisSpacing: 10.w,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (context, index) {
                    return const SkeltonShimmer(
                      height: 110,
                      width: double.infinity,
                      shape: BoxShape.rectangle,
                    );
                  },
                )),
              );
            },
            orElse: () {
              return EmptyErrorContainer(
                text: 'Error Loading Products',
                height: 340.h,
              );
            },
          );
        },
      ),
    );
  }
}
