// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_category_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCategoriesRequest _$AddCategoriesRequestFromJson(
        Map<String, dynamic> json) =>
    AddCategoriesRequest(
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$AddCategoriesRequestToJson(
        AddCategoriesRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
    };
