import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mo_store/core/network/dio_factory.dart';
import 'package:mo_store/features/login/data/api/login_api.dart';
import 'package:mo_store/features/login/data/repo/login_repo.dart';
import 'package:mo_store/features/login/logic/login/login_cubit.dart';

GetIt di = GetIt.instance;

class AppInjection {
  static Future injectorInit() async {
    //^ dio and api services
    Dio dio = DioFactory.getDio();
    di.registerLazySingleton<LoginApi>(() => LoginApi(dio));

    // //^ login cubit and repo
    di
      ..registerLazySingleton<LoginRepo>(() => LoginRepo(loginApi: di()))
      ..registerFactory<LoginCubit>(() => LoginCubit(loginRepo: di()));

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
  }
}
