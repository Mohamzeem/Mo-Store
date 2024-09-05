import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_store/features/home/logic/products_cubit/products_cubit.dart';
import 'package:mo_store/features/home/view/widgets/categories_widgets/categories_with_cubit.dart';
import 'package:mo_store/features/home/view/widgets/home_widgets/banners.dart';
import 'package:mo_store/features/home/view/widgets/home_widgets/home_search_bar.dart';
import 'package:mo_store/features/home/view/widgets/products_widgets/products_viewall_btn.dart';
import 'package:mo_store/features/home/view/widgets/products_widgets/products_with_cubit.dart';

class HomeBody extends StatelessWidget {
  final ScrollController scrollController;
  const HomeBody({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final allprodList = BlocProvider.of<ProductsCubit>(context).allProductsList;

    return CustomScrollView(
      controller: scrollController,
      slivers: [
        HomeSearchBar(allprodList: allprodList),
        const Banners(),
        CategoriesWithCubit(allprodList: allprodList),
        const ProductsListWithCubit(),
        const ViewAllProductsButton(),
      ],
    );
  }
}
