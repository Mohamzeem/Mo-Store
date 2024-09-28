import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/app/app_globals.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/features/admin/view/categories/categories_view.dart';
import 'package:mo_store/features/admin/view/notifications/notifications_view.dart';
import 'package:mo_store/features/admin/view/products/products_view.dart';
import 'package:mo_store/features/admin/view/dashboard/dashboard_view.dart';
import 'package:mo_store/features/admin/view/users/users_view.dart';

List<DrawerItemModel> adminDrawerList(BuildContext context) {
  return <DrawerItemModel>[
    //^ DashBoard
    DrawerItemModel(
      icon: const Icon(Icons.dashboard, color: AppColors.primaryColor),
      title: Text(
        'DashBoard',
        style: AppFonts.medium22Primary.copyWith(fontSize: 18.sp),
      ),
      page: const DashboardView(),
    ),
    //^ Categories
    DrawerItemModel(
      icon: const Icon(Icons.category_outlined, color: AppColors.primaryColor),
      title: Text(
        'Categories',
        style: AppFonts.medium22Primary.copyWith(fontSize: 18.sp),
      ),
      page: const CategoriesView(),
    ),
    //^ Product
    DrawerItemModel(
      icon: const Icon(
        Icons.production_quantity_limits,
        color: AppColors.primaryColor,
      ),
      title: Text(
        'Products',
        style: AppFonts.medium22Primary.copyWith(fontSize: 18.sp),
      ),
      page: const ProductsScreen(),
    ),
    //^ Users
    DrawerItemModel(
      icon: const Icon(Icons.people_alt_rounded, color: AppColors.primaryColor),
      title: Text(
        'Users',
        style: AppFonts.medium22Primary.copyWith(fontSize: 18.sp),
      ),
      page: const UsersView(),
    ),
    //^ Notifications
    DrawerItemModel(
      icon:
          const Icon(Icons.notifications_active, color: AppColors.primaryColor),
      title: Text(
        'Notifications',
        style: AppFonts.medium22Primary.copyWith(fontSize: 18.sp),
      ),
      page: const NotificationsView(),
    ),
    //^ LogOut
    DrawerItemModel(
      icon: const Icon(Icons.exit_to_app, color: AppColors.primaryColor),
      title: GestureDetector(
        onTap: () => AppGlobals.logOut(context),
        child: Text(
          'Logout',
          style: AppFonts.medium22Primary.copyWith(fontSize: 18.sp),
        ),
      ),
      page: const UsersView(),
    ),
  ];
}

class DrawerItemModel {
  DrawerItemModel({
    required this.icon,
    required this.title,
    required this.page,
  });

  final Icon icon;
  final Widget title;
  final Widget page;
}
