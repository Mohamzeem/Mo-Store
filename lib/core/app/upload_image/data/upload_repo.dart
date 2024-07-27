import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mo_store/core/app/upload_image/data/upload_api.dart';
import 'package:mo_store/core/app/upload_image/data/upload_response.dart';
import 'package:mo_store/core/network/api_result.dart';

class UploadImageRepo {
  final UploadImageApi uploadImageApi;
  UploadImageRepo({required this.uploadImageApi});

  Future<ApiResult<UploadImageResponseBody>> uploadImage(
      {required XFile image}) async {
    final data = FormData.fromMap({
      'files': [await MultipartFile.fromFile(image.path, filename: image.name)],
    });
    try {
      final result = await uploadImageApi.uploadImage(data);
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
