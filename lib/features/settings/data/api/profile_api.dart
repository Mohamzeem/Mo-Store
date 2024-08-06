import 'package:dio/dio.dart';
import 'package:mo_store/core/network/end_points.dart';
import 'package:mo_store/features/settings/data/models/profile_model.dart';
import 'package:mo_store/features/settings/data/models/update_profile_request.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_api.g.dart';

@RestApi(baseUrl: AppEndPoints.baseUrl)
abstract class ProfileApi {
  factory ProfileApi(Dio dio, {String baseUrl}) = _ProfileApi;

  @GET(AppEndPoints.getProfile)
  Future<ProfileModel> getProfile();

  @PUT('${AppEndPoints.updateUserInfo}/{id}')
  Future<ProfileModel> updateProfile(
      @Body() UpdateProfileRequest value, @Path('id') int id);
}
