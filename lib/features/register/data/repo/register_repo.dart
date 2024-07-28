import 'package:mo_store/core/network/api_result.dart';
import 'package:mo_store/features/register/data/api/register_api.dart';
import 'package:mo_store/features/register/data/models/register_request.dart';

class RegisterRepo {
  final RegisterApi registerApi;
  RegisterRepo({required this.registerApi});
  Future<ApiResult> register(RegisterRequestModel registerRequestModel) async {
    try {
      final result = await registerApi.register(registerRequestModel);
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
