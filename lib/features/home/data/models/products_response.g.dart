// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsResponseBody _$ProductsResponseBodyFromJson(
        Map<String, dynamic> json) =>
    ProductsResponseBody(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['image'] as String?,
      json['creationAt'] as String?,
      json['updatedAt'] as String?,
    );

Map<String, dynamic> _$ProductsResponseBodyToJson(
        ProductsResponseBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'creationAt': instance.creationAt,
      'updatedAt': instance.updatedAt,
    };
