import 'package:mo_store/core/network/api_result.dart';
import 'package:mo_store/features/admin/data/api/all_users_api.dart';
import 'package:mo_store/features/settings/data/models/profile_model.dart';

class AllUsersRepo {
  final AllUsersApi usersApi;
  AllUsersRepo({required this.usersApi});

  Future<ApiResult<List<ProfileModel>>> getAllUsers() async {
    try {
      final response = await usersApi.getAllUsers();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
