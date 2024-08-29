import 'package:mo_store/core/consts/pref_keys.dart';
import 'package:mo_store/core/local_database/shared_prefs.dart';
import 'package:mo_store/core/network/api_result.dart';
import 'package:mo_store/core/network/dio_factory.dart';
import 'package:mo_store/features/login/data/api/login_api.dart';
import 'package:mo_store/features/login/data/models/login_request.dart';
import 'package:mo_store/features/login/data/models/login_response.dart';

class LoginRepo {
  final LoginApi loginApi;
  LoginRepo({required this.loginApi});

  Future<ApiResult<LoginResponseBody>> login(
      LoginRequestModel loginRequestModel) async {
    try {
      final result = await loginApi.login(loginRequestModel);
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(PrefKeys.userToken, token);
    DioFactory.refreshToken(token);
  }
}
