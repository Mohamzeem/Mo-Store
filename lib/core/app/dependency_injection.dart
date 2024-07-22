// import 'package:dio/dio.dart';
// import 'package:doctorna/core/network/api_services.dart';
// import 'package:doctorna/core/network/dio_factory.dart';
// import 'package:doctorna/features/home/cubit/home_cubit/home_cubit.dart';
// import 'package:doctorna/features/home/data/home_api.dart';
// import 'package:doctorna/features/home/data/repo/home_repo.dart';
// import 'package:doctorna/features/login/cubit/login_cubit/login_cubit.dart';
// import 'package:doctorna/features/login/data/repos/login_repo.dart';
// import 'package:doctorna/features/register/cubit/register_cubit/register_cubit.dart';
// import 'package:doctorna/features/register/data/repos/register_repo.dart';
// import 'package:get_it/get_it.dart';

// final GetIt di = GetIt.instance;

// class DependencyInjector {
//   static Future injectorInit() async {
//     //^ dio and api services
//     Dio dio = DioFactory.getDio();
//     di.registerLazySingleton<ApiServices>(() => ApiServices(dio));

// //^ login cubit and repo
//     di
//       ..registerLazySingleton<LoginRepo>(() => LoginRepo(apiServices: di()))
//       ..registerFactory<LoginCubit>(() => LoginCubit(repo: di()));

// //^ register cubit and repo
//     di
//       ..registerLazySingleton<RegisterRepo>(
//           () => RegisterRepo(apiServices: di()))
//       ..registerFactory<RegisterCubit>(() => RegisterCubit(repo: di()));

// //^ home cubit and repo
//     di
//       ..registerLazySingleton<HomeApi>(() => HomeApi(dio))
//       ..registerLazySingleton<HomeRepo>(() => HomeRepo(homeApi: di()))
//       ..registerFactory<HomeCubit>(() => HomeCubit(homeRepo: di()));
//   }
// }
