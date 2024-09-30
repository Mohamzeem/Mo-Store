import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/features/admin/logic/all_users_cubit/all_users_cubit.dart';
import 'package:mo_store/features/admin/view/dashboard/dashboard_view.dart';
import 'package:mo_store/core/helpers/text_fonts.dart';
import 'package:mo_store/features/admin/view/admin/widegts/admin_app_bar.dart';
import 'package:mo_store/features/admin/view/admin/widegts/admin_drawar_list.dart';
import 'package:mo_store/features/home/logic/categories_cubit/categories_cubit.dart';
import 'package:mo_store/features/home/logic/products_cubit/products_cubit.dart';

class AdminView extends StatefulWidget {
  const AdminView({super.key});

  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  Widget page = const DashboardView();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoriesCubit>(context).getCategories();
    BlocProvider.of<ProductsCubit>(context).getProducts();
    // BlocProvider.of<AllUsersCubit>(context).getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ZoomDrawer(
          menuScreen: Builder(
            builder: (context) => MenuView(
              onPageChanged: (a) {
                setState(() => page = a);
                ZoomDrawer.of(context)!.close();
              },
            ),
          ),
          mainScreen: page,
          borderRadius: 20,
          showShadow: true,
          drawerShadowsBackgroundColor: AppColors.lightBlue,
        ),
      ),
    );
  }
}

class MenuView extends StatelessWidget {
  final void Function(Widget) onPageChanged;
  const MenuView({
    super.key,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AdminAppBar(
            title: 'MO STORE',
            style: AppFonts.appBarTitle.copyWith(fontSize: 20),
            padding: 20,
            isMain: false,
          ),
          Column(
            children: adminDrawerList(context)
                .map(
                  (e) => ListTile(
                    title: e.title,
                    leading: e.icon,
                    onTap: () {
                      onPageChanged(e.page);
                    },
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
