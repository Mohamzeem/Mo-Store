// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesRequest _$CategoriesRequestFromJson(Map<String, dynamic> json) =>
    CategoriesRequest(
      id: json['id'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$CategoriesRequestToJson(CategoriesRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
