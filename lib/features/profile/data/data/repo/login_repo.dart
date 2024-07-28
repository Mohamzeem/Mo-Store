import 'package:mo_store/core/network/api_result.dart';
import 'package:mo_store/features/profile/data/data/api/profile_api.dart';
import 'package:mo_store/features/profile/data/data/models/profile_model.dart';

class LoginRepo {
  final ProfileApi profileApi;
  LoginRepo({required this.profileApi});

  Future<ApiResult<ProfileModel>> getProfile() async {
    try {
      final result = await profileApi.getProfile();

      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
