// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mo_store/core/widgets/skelton_shimmer.dart';
import 'package:mo_store/features/home/logic/all_products_cubit/all_products_cubit.dart';
import 'package:mo_store/features/home/logic/all_products_cubit/all_products_state.dart';
import 'package:mo_store/features/home/view/widgets/all_prodcuts/all_products_list.dart';
import 'package:mo_store/features/home/view/widgets/home_widgets/empty_error_container.dart';

class AllProductsListWithCubit extends StatelessWidget {
  final AllProductsCubit cubit;
  const AllProductsListWithCubit({
    super.key,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<AllProductsCubit, AllProductsState>(
        builder: (context, state) {
          return state.maybeWhen(
            success: (products) =>
                AllProductsList(products: products, cubit: cubit),
            empty: () {
              return EmptyErrorContainer(
                text: 'No Products',
                height: 320.h,
              );
            },
            loading: (_) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Center(
                    child: GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 8,
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
