import 'package:mo_store/core/network/api_result.dart';
import 'package:mo_store/features/admin/data/data_source/users_data_source.dart';
import 'package:mo_store/features/admin/data/models/all_users_respons.dart';

class AllUsersRepo {
  final UsersDataSource usersDataSource;
  AllUsersRepo({required this.usersDataSource});

  Future<ApiResult<AllUsersResponse>> getAllUsers() async {
    try {
      final response = await usersDataSource.getAllUsers();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
