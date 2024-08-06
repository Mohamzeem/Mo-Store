import 'package:dio/dio.dart';
import 'package:mo_store/core/network/end_points.dart';
import 'package:mo_store/features/login/data/models/login_request.dart';
import 'package:mo_store/features/login/data/models/login_response.dart';
import 'package:retrofit/retrofit.dart';
part 'login_api.g.dart';

@RestApi(baseUrl: AppEndPoints.baseUrl)
abstract class LoginApi {
  factory LoginApi(Dio dio, {String baseUrl}) = _LoginApi;

  @POST(AppEndPoints.loginRequest)
  Future<LoginResponseBody> login(@Body() LoginRequestModel loginRequestModel);
}
