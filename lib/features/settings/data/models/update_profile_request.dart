import 'package:json_annotation/json_annotation.dart';

part 'update_profile_request.g.dart';

@JsonSerializable()
class UpdateProfileRequest {
  String? email;
  String? password;
  String? name;
  String? avatar;
  String? updatedAt;

  UpdateProfileRequest({
    this.name,
    this.email,
    this.password,
    this.avatar,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() => _$UpdateProfileRequestToJson(this);
}
