import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_store/features/admin/view/dashboard/widgets/dashboard_container.dart';
import 'package:mo_store/features/admin/view/dashboard/widgets/error_container.dart';
import 'package:mo_store/features/home/logic/products_cubit/products_cubit.dart';
import 'package:mo_store/features/home/logic/products_cubit/products_state.dart';

class ProductsContainerWithCubit extends StatelessWidget {
  const ProductsContainerWithCubit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const ErrorContainer(
            text: 'Products',
          ),
          successProducts: (products) => DashboardContainer(
            title: 'Products',
            number: products.length.toString(),
            image: 'assets/images/pngs/products.png',
          ),
          loadingProducts: () => const DashboardContainer(
            isLoading: true,
            title: 'Products',
            number: '',
            image: 'assets/images/pngs/products.png',
          ),
        );
      },
    );
  }
}
