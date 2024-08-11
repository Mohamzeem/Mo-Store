import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/features/cart/cart_view.dart';
import 'package:mo_store/features/favorites/favorites_view.dart';
import 'package:mo_store/features/home/view/home_view.dart';
import 'package:mo_store/features/notifications/notifications_view.dart';
import 'package:mo_store/features/settings/logic/profile/profile_cubit.dart';
import 'package:mo_store/features/settings/view/settings_view.dart';

class ControlView extends StatefulWidget {
  const ControlView({super.key});

  @override
  State<ControlView> createState() => _ControlViewState();
}

class _ControlViewState extends State<ControlView> {
  int index = 2;

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart_outlined),
      label: 'Cart',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite_border_outlined),
      label: 'Favorites',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.notifications_outlined),
      label: 'Notifications',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings_outlined),
      label: 'Profile',
    ),
  ];
  Widget getSelectedWidget() {
    Widget widget;
    switch (index) {
      case 0:
        widget = const CartView();
        break;
      case 1:
        widget = const FavoritesView();
        break;
      case 2:
        widget = const HomeView();
        break;
      case 3:
        widget = const NotificationsView();
        break;
      case 4:
        widget = const SettingsView();
        break;
      default:
        widget = const HomeView();
        break;
    }
    return widget;
  }

  late ProfileCubit _cubit;
  @override
  // void initState() {
  //   super.initState();
  //   _cubit = BlocProvider.of<ProfileCubit>(context);
  //   _cubit.getProfile();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: index,
        onTap: (value) => setState(() => index = value),
        unselectedItemColor: AppColors.lightBlue,
        selectedItemColor: AppColors.primaryColor,
        backgroundColor: AppColors.white,
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        iconSize: 35.r,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(size: 40.r),
      ),
      body: SafeArea(child: getSelectedWidget()),
    );
  }
}
