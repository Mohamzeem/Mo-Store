// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesResponseBody _$CategoriesResponseBodyFromJson(
        Map<String, dynamic> json) =>
    CategoriesResponseBody(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['image'] as String?,
      json['creationAt'] as String?,
      json['updatedAt'] as String?,
    );

Map<String, dynamic> _$CategoriesResponseBodyToJson(
        CategoriesResponseBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'creationAt': instance.creationAt,
      'updatedAt': instance.updatedAt,
    };
