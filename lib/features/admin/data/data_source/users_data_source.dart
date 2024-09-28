import 'package:mo_store/core/network/graphql_queries/users_queries.dart';
import 'package:mo_store/features/admin/data/api/all_users_api.dart';
import 'package:mo_store/features/admin/data/models/all_users_respons.dart';

class UsersDataSource {
  final AllUsersApi usersApi;

  UsersDataSource({required this.usersApi});

  Future<AllUsersResponse> getAllUsers() async {
    final response = await usersApi
        .getAllUsers(GraphQlUsersQueries().getAllCategoriesMapQuery());
    return response;
  }
}
