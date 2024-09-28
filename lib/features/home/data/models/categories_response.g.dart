// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesResponseBody _$CategoriesResponseBodyFromJson(
        Map<String, dynamic> json) =>
    CategoriesResponseBody(
      json['data'] == null
          ? null
          : CategoriesAllData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoriesResponseBodyToJson(
        CategoriesResponseBody instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

CategoriesAllData _$CategoriesAllDataFromJson(Map<String, dynamic> json) =>
    CategoriesAllData(
      (json['categories'] as List<dynamic>)
          .map((e) => CategoriesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoriesAllDataToJson(CategoriesAllData instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };

CategoriesModel _$CategoriesModelFromJson(Map<String, dynamic> json) =>
    CategoriesModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$CategoriesModelToJson(CategoriesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
