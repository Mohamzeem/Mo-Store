import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/helpers/extensions.dart';
import 'package:mo_store/core/route/routes.dart';
import 'package:mo_store/core/widgets/custom_app_bar.dart';
import 'package:mo_store/features/home/view/widgets/all_prodcuts_view_widgets/all_products_with_cubit.dart';

class AllProductsView extends StatelessWidget {
  const AllProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Stack(
            children: [
              CustomAppBar(
                title: 'All Products',
                isArrowBack: true,
                backBtn: () => context.pushReplacmentName(Routes.controlView),
              ),
              const AllProductsListWithCubit(),
            ],
          ),
        ),
      ),
    );
  }
}
