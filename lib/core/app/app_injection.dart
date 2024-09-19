import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mo_store/core/app/upload_image/data/upload_api.dart';
import 'package:mo_store/core/app/upload_image/data/upload_repo.dart';
import 'package:mo_store/core/app/upload_image/logic/upload_image/upload_image_cubit.dart';
import 'package:mo_store/core/network/dio_factory.dart';
import 'package:mo_store/features/admin/data/api/all_users_api.dart';
import 'package:mo_store/features/admin/data/data_source/users_data_source.dart';
import 'package:mo_store/features/admin/data/repo/users_repo.dart';
import 'package:mo_store/features/admin/logic/all_users_cubit/all_users_cubit.dart';
import 'package:mo_store/features/favorites/logic/favorites_cubit/favorites_cubit.dart';
import 'package:mo_store/features/home/data/api/all_products_api.dart';
import 'package:mo_store/features/home/data/api/categories_api.dart';
import 'package:mo_store/features/home/data/api/products_api.dart';
import 'package:mo_store/features/home/data/data_source/home_data_source.dart';
import 'package:mo_store/features/home/data/repo/all_products_repo.dart';
import 'package:mo_store/features/home/data/repo/categories_repo.dart';
import 'package:mo_store/features/home/data/repo/products_repo.dart';
import 'package:mo_store/features/home/logic/all_products_cubit/all_products_cubit.dart';
import 'package:mo_store/features/home/logic/categories_cubit/categories_cubit.dart';
import 'package:mo_store/features/home/logic/products_cubit/products_cubit.dart';
import 'package:mo_store/features/login/data/api/login_api.dart';
import 'package:mo_store/features/login/data/repo/login_repo.dart';
import 'package:mo_store/features/login/logic/login_cubit/login_cubit.dart';
import 'package:mo_store/features/register/data/api/register_api.dart';
import 'package:mo_store/features/register/data/repo/register_repo.dart';
import 'package:mo_store/features/register/logic/register/register_cubit.dart';
import 'package:mo_store/features/settings/data/api/profile_api.dart';
import 'package:mo_store/features/settings/data/repo/profile_repo.dart';
import 'package:mo_store/features/settings/logic/profile/profile_cubit.dart';

GetIt di = GetIt.instance;

class AppInjection {
  static Future injectorInit() async {
//^ dio services
    Dio dio = DioFactory.getDio();

// //^ login cubit & repo & api
    di
      ..registerLazySingleton<LoginApi>(() => LoginApi(dio))
      ..registerLazySingleton<LoginRepo>(() => LoginRepo(loginApi: di()))
      ..registerFactory<LoginCubit>(() => LoginCubit(loginRepo: di()));

//^ register cubit & repo & api
    di
      ..registerLazySingleton<RegisterApi>(() => RegisterApi(dio))
      ..registerLazySingleton<RegisterRepo>(
          () => RegisterRepo(registerApi: di()))
      ..registerFactory<RegisterCubit>(() => RegisterCubit(registerRepo: di()));

//^ uploadimage cubit & repo & api
    di
      ..registerLazySingleton<UploadImageApi>(() => UploadImageApi(dio))
      ..registerLazySingleton<UploadImageRepo>(
          () => UploadImageRepo(uploadImageApi: di()))
      ..registerFactory<UploadImageCubit>(
          () => UploadImageCubit(uploadImageRepo: di()));

//^ profile cubit & repo & api
    di
      ..registerLazySingleton<ProfileApi>(() => ProfileApi(dio))
      ..registerLazySingleton<ProfileRepo>(() => ProfileRepo(profileApi: di()))
      ..registerFactory<ProfileCubit>(
          () => ProfileCubit(profileRepo: di(), uploadImageRepo: di()));

//^ home cubit & repo & api
    di
      ..registerLazySingleton<CategoriesApi>(() => CategoriesApi(dio))
      ..registerLazySingleton<ProductsApi>(() => ProductsApi(dio))
      ..registerLazySingleton<HomeDataSource>(
          () => HomeDataSource(categoriesApi: di()))
      ..registerLazySingleton<CategoriesRepo>(
          () => CategoriesRepo(dataSource: di()))
      ..registerLazySingleton<ProductsRepo>(
          () => ProductsRepo(productsApi: di()))
      ..registerFactory<CategoriesCubit>(
          () => CategoriesCubit(categoriesRepo: di()))
      ..registerFactory<ProductsCubit>(() => ProductsCubit(productsRepo: di()));

//^ all products view cubit & repo & api
    di
      ..registerLazySingleton<AllProductsApi>(() => AllProductsApi(dio))
      ..registerLazySingleton<AllProductsRepo>(
          () => AllProductsRepo(allProductsApi: di()))
      ..registerFactory<AllProductsCubit>(
          () => AllProductsCubit(allProductsRepo: di()));

//^ all users view cubit & repo & api
    di
      ..registerLazySingleton<AllUsersApi>(() => AllUsersApi(dio))
      ..registerLazySingleton<UsersDataSource>(
          () => UsersDataSource(usersApi: di()))
      ..registerLazySingleton<AllUsersRepo>(
          () => AllUsersRepo(usersDataSource: di()))
      ..registerFactory<AllUsersCubit>(() => AllUsersCubit(usersRepo: di()));

    //^ favorites cubit & repo & api
    di.registerFactory<FavoritesCubit>(() => FavoritesCubit());
  }
}
