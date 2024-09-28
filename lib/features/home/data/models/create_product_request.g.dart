// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_product_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProductRequest _$CreateProductRequestFromJson(
        Map<String, dynamic> json) =>
    CreateProductRequest(
      title: json['title'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      categoryId: (json['categoryId'] as num?)?.toDouble(),
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CreateProductRequestToJson(
        CreateProductRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'categoryId': instance.categoryId,
      'images': instance.images,
    };
