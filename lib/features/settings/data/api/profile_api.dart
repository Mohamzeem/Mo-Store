import 'package:dio/dio.dart';
import 'package:mo_store/core/network/end_points.dart';
import 'package:mo_store/features/settings/data/models/profile_model.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_api.g.dart';

@RestApi(baseUrl: AppEndPoints.baseUrl)
abstract class ProfileApi {
  factory ProfileApi(Dio dio, {String baseUrl}) = _ProfileApi;

  @GET(AppEndPoints.getProfile)
  Future<ProfileModel> getProfile();

  // @PUT(AppEndPoints.updateUserInfo +
  //     SharedPrefHelper.getSecuredString(PrefKeys.userId))
  // Future<ProfileModel> updateProfile(@Body() ProfileModel profileModel);
}
