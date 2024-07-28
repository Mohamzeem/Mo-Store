import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequestModel {
  final String name;
  final String email;
  final String password;
  final String avatar;

  RegisterRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.avatar,
  });

  Map<String, dynamic> toJson() => _$RegisterRequestModelToJson(this);
}
