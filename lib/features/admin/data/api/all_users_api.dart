import 'package:dio/dio.dart';
import 'package:mo_store/core/network/end_points.dart';
import 'package:mo_store/features/admin/data/models/all_users_respons.dart';
import 'package:retrofit/retrofit.dart';

part 'all_users_api.g.dart';

@RestApi(baseUrl: AppEndPoints.baseUrl)
abstract class AllUsersApi {
  factory AllUsersApi(Dio dio, {String baseUrl}) = _AllUsersApi;

  @POST(AppEndPoints.graphql)
  Future<AllUsersResponse> getAllUsers(@Body() Map<String, dynamic> body);
}
