import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/prints.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/core/widgets/skelton_shimmer.dart';
import 'package:mo_store/features/home/logic/all_products_cubit/all_products_cubit.dart';
import 'package:mo_store/features/home/logic/all_products_cubit/all_products_state.dart';
import 'package:mo_store/features/home/view/widgets/home_widgets/empty_error_container.dart';
import 'package:mo_store/features/home/view/widgets/products_widgets/product_item.dart';

class AllProductsListWithCubit extends StatefulWidget {
  const AllProductsListWithCubit({
    super.key,
  });

  @override
  State<AllProductsListWithCubit> createState() =>
      _AllProductsListWithCubitState();
}

class _AllProductsListWithCubitState extends State<AllProductsListWithCubit> {
  late AllProductsCubit _cubit;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<AllProductsCubit>(context);
    _cubit.getPaginatedProducts();
    scrollController.addListener(() {
      _cubit.scrollListener(scrollController: scrollController);
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: BlocBuilder<AllProductsCubit, AllProductsState>(
        builder: (context, state) {
          if (state is AllProductsLoading) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: Column(
                children: [
                  SizedBox(height: 55.h),
                  Expanded(
                    child: GridView.builder(
                      controller: scrollController,
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
                    ),
                  ),
                ],
              ),
            );
          } else if (state is AllProductsFailure) {
            return EmptyErrorContainer(
              text: state.errMessage.toString(),
              height: double.infinity,
            );
          } else {
            final products = state.list;
            Prints.debug(message: state.list.length.toString());
            return Column(
              children: [
                SizedBox(height: 55.h),
                Expanded(
                  child: GridView.builder(
                    controller: scrollController,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: products.length,
                    semanticChildCount: 2,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.h,
                      crossAxisSpacing: 10.w,
                      childAspectRatio: 0.9,
                    ),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductItem(product: product);
                    },
                  ),
                ),
                if (state.hasMore == true && state.list.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Scroll down...',
                      style: AppFonts.regular16Primary
                          .copyWith(color: AppColors.lightBlue),
                    ),
                  ),
              ],
            );
          }
        },
      ),
    );
  }
}
