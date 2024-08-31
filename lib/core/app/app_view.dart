import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/app/app_globals.dart';
import 'package:mo_store/core/app/app_injection.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/route/app_router.dart';
import 'package:mo_store/core/route/routes.dart';
import 'package:mo_store/features/favorites/logic/favorites_cubit/favorites_cubit.dart';
import 'package:mo_store/features/home/logic/categories_cubit/categories_cubit.dart';
import 'package:mo_store/features/home/logic/products_cubit/products_cubit.dart';
import 'package:mo_store/features/onboarding/onboarding_view.dart';
import 'package:mo_store/features/settings/logic/profile/profile_cubit.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di<ProfileCubit>()..getProfile()),
        BlocProvider(
            create: (context) => di<CategoriesCubit>()..getCategories()),
        BlocProvider(create: (context) => di<ProductsCubit>()..getProducts()),
        BlocProvider(create: (context) => di<FavoritesCubit>()),
      ],
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: ScreenUtilInit(
          designSize: AppGlobals.appSize,
          minTextAdapt: true,
          splitScreenMode: true,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.white,
              fontFamily: AppGlobals.appFont,
            ),
            home: const OnboardingView(),
            initialRoute: AppGlobals().isUserLoggedIn
                ? Routes.onboardingView
                : Routes.controlView,
            onGenerateRoute: AppRouter().generateRoute,
          ),
        ),
      ),
    );
  }
}
