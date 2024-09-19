// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_users_respons.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllUsersResponse _$AllUsersResponseFromJson(Map<String, dynamic> json) =>
    AllUsersResponse(
      json['data'] == null
          ? null
          : UsersData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AllUsersResponseToJson(AllUsersResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

UsersData _$UsersDataFromJson(Map<String, dynamic> json) => UsersData(
      (json['users'] as List<dynamic>?)
          ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UsersDataToJson(UsersData instance) => <String, dynamic>{
      'users': instance.users,
    };

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };
