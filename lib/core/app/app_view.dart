import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mo_store/core/app/app_globals.dart';
import 'package:mo_store/core/consts/app_colors.dart';
import 'package:mo_store/core/route/app_router.dart';
import 'package:mo_store/core/route/routes.dart';
import 'package:mo_store/features/onboarding/onboarding_view.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}
