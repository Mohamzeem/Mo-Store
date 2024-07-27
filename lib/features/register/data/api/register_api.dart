import 'package:dio/dio.dart';
import 'package:mo_store/core/network/end_points.dart';
import 'package:mo_store/features/register/data/models/register_request.dart';
import 'package:retrofit/retrofit.dart';

part 'register_api.g.dart';

@RestApi(baseUrl: AppEndPoints.baseUrl)
abstract class RegisterApi {
  factory RegisterApi(Dio dio, {String baseUrl}) = _RegisterApi;

  @POST(AppEndPoints.registerRequest)
  Future register(@Body() RegisterRequestModel registerRequestModel);
}
