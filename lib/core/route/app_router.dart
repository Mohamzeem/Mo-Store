import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_store/core/app/app_injection.dart';
import 'package:mo_store/core/app/upload_image/logic/upload_image/upload_image_cubit.dart';
import 'package:mo_store/core/route/routes.dart';
import 'package:mo_store/features/control/control_view.dart';
import 'package:mo_store/features/home/data/models/categories_response.dart';
import 'package:mo_store/features/home/data/models/products_response.dart';
import 'package:mo_store/features/home/logic/all_products_cubit/all_products_cubit.dart';
import 'package:mo_store/features/home/logic/products_cubit/products_cubit.dart';
import 'package:mo_store/features/home/view/all_products_view.dart';
import 'package:mo_store/features/home/view/categories_view.dart';
import 'package:mo_store/features/home/view/product_details_view.dart';
import 'package:mo_store/features/home/view/search_products_view.dart';
import 'package:mo_store/features/login/logic/login_cubit/login_cubit.dart';
import 'package:mo_store/features/login/view/login_view.dart';
import 'package:mo_store/features/onboarding/onboarding_view.dart';
import 'package:mo_store/features/register/logic/register/register_cubit.dart';
import 'package:mo_store/features/register/view/register_view.dart';
import 'package:mo_store/features/settings/logic/profile/profile_cubit.dart';
import 'package:mo_store/features/settings/view/profile_view.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final args = settings.arguments;

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
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => di<RegisterCubit>()),
              BlocProvider(create: (context) => di<UploadImageCubit>()),
            ],
            child: const RegisterView(),
          ),
        );
      case Routes.controlView:
        return MaterialPageRoute(
          builder: (_) => const ControlView(),
        );
      case Routes.searchProductsView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => di<ProductsCubit>(),
            child: SearchProductsView(
                allprodList: args as List<ProductsResponseBody>),
          ),
        );
      case Routes.profileView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => di<ProfileCubit>()..getProfile(),
            child: const ProfileView(),
          ),
        );
      case Routes.allProductsView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => di<AllProductsCubit>(),
            child: const AllProductsView(),
          ),
        );
      case Routes.productDetailsView:
        return MaterialPageRoute(
          builder: (_) {
            return ProductDetailsView(product: args as ProductsResponseBody);
          },
        );
      case Routes.categoriesView:
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider(
              create: (context) => di<ProductsCubit>(),
              child: CategoriesView(
                  categoryInfo: args as ({
                List<ProductsResponseBody> allprodList,
                CategoriesResponseBody category
              })),
            );
          },
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('NO Route Found ${settings.name}'),
            ),
          ),
        );
    }
  }
}
