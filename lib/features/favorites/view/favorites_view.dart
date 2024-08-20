import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/widgets/custom_app_bar.dart';
import 'package:mo_store/features/favorites/view/widgets/favorites_with_cubit.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: const Stack(
            children: [
              CustomAppBar(title: 'Your Favorites'),
              FavoritesWithCubit(),
            ],
          ),
        ),
      ),
    );
  }
}
