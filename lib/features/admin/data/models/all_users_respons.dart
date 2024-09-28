// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_users_respons.g.dart';

@JsonSerializable()
class AllUsersResponse {
  UsersData? data;
  AllUsersResponse(
    this.data,
  );

  List<UserModel> get usersList {
    if (data!.users!.isEmpty) {
      return [];
    }
    return data!.users!;
  }

  String get usersListNumber {
    if (data!.users!.isEmpty) {
      return '0';
    }
    return data!.users!.length.toString();
  }

  factory AllUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$AllUsersResponseFromJson(json);
}

@JsonSerializable()
class UsersData {
  List<UserModel>? users;
  UsersData(
    this.users,
  );
  factory UsersData.fromJson(Map<String, dynamic> json) =>
      _$UsersDataFromJson(json);
}

@JsonSerializable()
class UserModel {
  String? id;
  String? name;
  String? email;
  UserModel({
    this.id,
    this.name,
    this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
