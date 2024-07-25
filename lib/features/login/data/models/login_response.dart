import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponseBody {
  @JsonKey(name: 'access_token')
  String? accessToken;
  @JsonKey(name: 'refresh_token')
  String? refreshToken;
  LoginResponseBody(
    this.accessToken,
    this.refreshToken,
  );
  factory LoginResponseBody.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseBodyFromJson(json);
}
