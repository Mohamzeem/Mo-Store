import 'package:mo_store/core/network/api_result.dart';
import 'package:mo_store/features/login/data/api/login_api.dart';
import 'package:mo_store/features/login/data/models/login_request.dart';
import 'package:mo_store/features/login/data/models/login_response.dart';
import 'package:mo_store/features/login/data/models/profile_model.dart';

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

  Future<ApiResult<ProfileModel>> getProfile() async {
    try {
      final result = await loginApi.getProfile();

      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
