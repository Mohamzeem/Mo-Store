import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/helpers/prints.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/core/widgets/skelton_shimmer.dart';
import 'package:mo_store/features/home/logic/home_cubit/home_cubit.dart';
import 'package:mo_store/features/home/logic/home_cubit/home_state.dart';
import 'package:mo_store/features/home/view/widgets/products_widgets/products_list.dart';

class ProductsListWithCubit extends StatelessWidget {
  const ProductsListWithCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.maybeWhen(
            successProducts: (products) {
              Prints.debug(
                  message:
                      products[0].images![0].replaceAll(RegExp(r'[\[\]]'), '') +
                          products[0].title!);
              return ProductsList(products: products);
            },
            emptyProducts: () {
              return SizedBox(
                height: 320.h,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'No Products',
                    style: AppFonts.bold50Primary,
                  ),
                ),
              );
            },
            loadingProducts: () {
              return Center(
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
              ));
            },
            orElse: () => const SizedBox(),
          );
        },
      ),
    );
  }
}
