import 'package:dio/dio.dart';
import 'package:mo_store/core/consts/pref_keys.dart';
import 'package:mo_store/core/helpers/shared_prefs.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioInterceptor();
      addDioHeaders();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeaders() async {
    dio?.options.headers = {
      'content-type': 'application/json',
      'Authorization':
          'Bearer ${await SharedPrefHelper.getSecuredString(PrefKeys.userToken)}'
    };
  }

  // static void refreshToken(String token) {
  //   dio?.options.headers = {
  //     'Authorization': 'Bearer $token',
  //   };
  // }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
