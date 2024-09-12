import 'package:dio/dio.dart';
import 'package:mo_store/core/network/end_points.dart';
import 'package:mo_store/features/settings/data/models/profile_model.dart';
import 'package:retrofit/retrofit.dart';

part 'all_users_api.g.dart';

@RestApi(baseUrl: AppEndPoints.baseUrl)
abstract class AllUsersApi {
  factory AllUsersApi(Dio dio, {String baseUrl}) = _AllUsersApi;

  @GET(AppEndPoints.getusers)
  Future<List<ProfileModel>> getAllUsers();
}
