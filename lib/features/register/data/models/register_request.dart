import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequestModel {
  final String name;
  final String email;
  final String password;
  final String avatar;
  final String role;

  RegisterRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.avatar,
    required this.role,
  });

  Map<String, dynamic> toJson() => _$RegisterRequestModelToJson(this);
}
