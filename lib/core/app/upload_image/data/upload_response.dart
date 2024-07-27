import 'package:json_annotation/json_annotation.dart';

part 'upload_response.g.dart';

@JsonSerializable()
class UploadImageResponseBody {
  String? location;

  UploadImageResponseBody({this.location});

  factory UploadImageResponseBody.fromJson(Map<String, dynamic> json) =>
      _$UploadImageResponseBodyFromJson(json);
}
