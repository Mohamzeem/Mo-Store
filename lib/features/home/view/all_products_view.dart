import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/widgets/custom_app_bar.dart';
import 'package:mo_store/features/home/logic/all_products_cubit/all_products_cubit.dart';
import 'package:mo_store/features/home/view/widgets/all_prodcuts/all_products_with_cubit.dart';

class AllProductsView extends StatefulWidget {
  const AllProductsView({super.key});

  @override
  State<AllProductsView> createState() => _AllProductsViewState();
}

class _AllProductsViewState extends State<AllProductsView> {
  late AllProductsCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<AllProductsCubit>(context);
    _cubit.getPaginatedProducts();
    _cubit.getMoreProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: const CustomAppBar(
                    title: 'All Products',
                    isArrowBack: true,
                  ),
                ),
              ),
              AllProductsListWithCubit(cubit: _cubit),
            ],
          ),
        ),
      ),
    );
  }
}
