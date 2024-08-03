import 'package:mo_store/core/consts/pref_keys.dart';
import 'package:mo_store/core/helpers/shared_prefs.dart';
import 'package:mo_store/core/network/api_result.dart';
import 'package:mo_store/features/settings/data/api/profile_api.dart';
import 'package:mo_store/features/settings/data/models/profile_model.dart';
import 'package:mo_store/features/settings/data/models/update_profile_request.dart';

class ProfileRepo {
  final ProfileApi profileApi;
  ProfileRepo({required this.profileApi});

  Future<ApiResult<ProfileModel>> getProfile() async {
    try {
      final result = await profileApi.getProfile();
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<ProfileModel>> updateProfile(
      UpdateProfileRequest value) async {
    int id = int.parse(SharedPrefHelper.getSecuredString(PrefKeys.userId));
    try {
      final result = await profileApi.updateProfile(value, id);
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
