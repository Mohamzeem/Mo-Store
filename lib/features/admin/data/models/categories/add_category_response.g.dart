// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCategoriesResponseBody _$AddCategoriesResponseBodyFromJson(
        Map<String, dynamic> json) =>
    AddCategoriesResponseBody(
      json['data'] == null
          ? null
          : CategoriesAllData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddCategoriesResponseBodyToJson(
        AddCategoriesResponseBody instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

CategoriesAllData _$CategoriesAllDataFromJson(Map<String, dynamic> json) =>
    CategoriesAllData(
      CategoriesModel.fromJson(json['addCategory'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoriesAllDataToJson(CategoriesAllData instance) =>
    <String, dynamic>{
      'addCategory': instance.category,
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
