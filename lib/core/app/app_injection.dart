import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mo_store/core/app/upload_image/data/upload_api.dart';
import 'package:mo_store/core/app/upload_image/data/upload_repo.dart';
import 'package:mo_store/core/app/upload_image/logic/upload_image/upload_image_cubit.dart';
import 'package:mo_store/core/network/dio_factory.dart';
import 'package:mo_store/features/home/data/api/home_api.dart';
import 'package:mo_store/features/home/data/repo/home_repo.dart';
import 'package:mo_store/features/home/logic/home_cubit/home_cubit.dart';
import 'package:mo_store/features/login/data/api/login_api.dart';
import 'package:mo_store/features/login/data/repo/login_repo.dart';
import 'package:mo_store/features/login/logic/login/login_cubit.dart';
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
      ..registerLazySingleton<HomeApi>(() => HomeApi(dio))
      ..registerLazySingleton<HomeRepo>(() => HomeRepo(homeApi: di()))
      ..registerFactory<HomeCubit>(() => HomeCubit(homeRepo: di()));
  }
}
