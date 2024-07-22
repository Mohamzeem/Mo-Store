import 'package:flutter/material.dart';
import 'package:mo_store/core/route/routes.dart';
import 'package:mo_store/features/onboarding/onboarding_view.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case Routes.onboardingView:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
        );
      // case Routes.loginView:
      //   return MaterialPageRoute(
      //     builder: (_) => const LoginView(),
      //   );
      // case Routes.homeView:
      //   return MaterialPageRoute(
      //     builder: (_) => const HomeView(),
      //   );
      // case Routes.registerView:
      //   return MaterialPageRoute(
      //     builder: (_) => const RegisterView(),
      //   );

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
