import 'package:json_annotation/json_annotation.dart';

part 'update_profile_request.g.dart';

@JsonSerializable()
class UpdateProfileRequest {
  final String name;

  UpdateProfileRequest({
    required this.name,
  });

  Map<String, dynamic> toJson() => _$UpdateProfileRequestToJson(this);
}
