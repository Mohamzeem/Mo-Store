import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/features/admin/view/admin/widegts/admin_app_bar.dart';
import 'package:mo_store/features/admin/view/dashboard/widgets/dashboard_container.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AdminAppBar(
              title: 'Dashboard',
              padding: 20,
            ),
            10.verticalSpace,
            const DashboardContainer(
              title: 'Categories',
              number: '1,234',
              image: 'assets/images/pngs/category.png',
            ),
            const DashboardContainer(
              title: 'Products',
              number: '1,234',
              image: 'assets/images/pngs/products.png',
            ),
            const DashboardContainer(
              title: 'Users',
              number: '1,234',
              image: 'assets/images/pngs/users.png',
            ),
          ],
        ),
      ),
    );
  }
}
