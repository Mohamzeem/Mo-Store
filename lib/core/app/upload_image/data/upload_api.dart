import 'package:dio/dio.dart';
import 'package:mo_store/core/app/upload_image/data/upload_response.dart';
import 'package:mo_store/core/network/end_points.dart';
import 'package:retrofit/retrofit.dart';

part 'upload_api.g.dart';

@RestApi(baseUrl: AppEndPoints.baseUrl)
abstract class UploadImageApi {
  factory UploadImageApi(Dio dio, {String baseUrl}) = _UploadImageApi;

  @POST(AppEndPoints.uploadFile)
  Future<UploadImageResponseBody> uploadImage(@Body() FormData formData);
}
