import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_store/core/app/app_injection.dart';
import 'package:mo_store/core/route/routes.dart';
import 'package:mo_store/features/home/home_view.dart';
import 'package:mo_store/features/login/logic/login/login_cubit.dart';
import 'package:mo_store/features/login/view/login_view.dart';
import 'package:mo_store/features/onboarding/onboarding_view.dart';
import 'package:mo_store/features/register/register_view.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case Routes.onboardingView:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
        );
      case Routes.loginView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => di<LoginCubit>(),
            child: const LoginView(),
          ),
        );

      case Routes.registerView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => di<LoginCubit>(),
            child: const RegisterView(),
          ),
        );
      case Routes.homeView:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('NO Route Find ${settings.name}'),
            ),
          ),
        );
    }
  }
}
