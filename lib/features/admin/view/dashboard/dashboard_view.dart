import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/features/admin/logic/all_users_cubit/all_users_cubit.dart';
import 'package:mo_store/features/admin/view/admin/widegts/admin_app_bar.dart';
import 'package:mo_store/features/admin/view/dashboard/widgets/categories_with_cubit.dart';
import 'package:mo_store/features/admin/view/dashboard/widgets/products_with_cubit.dart';
import 'package:mo_store/features/admin/view/dashboard/widgets/users_with_cubit.dart';
import 'package:mo_store/features/home/logic/categories_cubit/categories_cubit.dart';
import 'package:mo_store/features/home/logic/products_cubit/products_cubit.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          color: AppColors.lightGrey,
          backgroundColor: AppColors.lightBlue,
          onRefresh: () async {
            BlocProvider.of<CategoriesCubit>(context).getCategories();
            BlocProvider.of<ProductsCubit>(context).getProducts();
            BlocProvider.of<AllUsersCubit>(context).getAllUsers();
          },
          child: ListView(
            children: [
              const AdminAppBar(
                title: 'Dashboard',
                padding: 20,
              ),
              10.verticalSpace,
              const CategoriesContainerWIthCubit(),
              const ProductsContainerWithCubit(),
              const UsersContainerWithCubit(),
            ],
          ),
        ),
      ),
    );
  }
}
