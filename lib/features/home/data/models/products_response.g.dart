// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsResponseBody _$ProductsResponseBodyFromJson(
        Map<String, dynamic> json) =>
    ProductsResponseBody(
      (json['id'] as num?)?.toInt(),
      json['title'] as String?,
      (json['price'] as num?)?.toInt(),
      json['description'] as String?,
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      json['creationAt'] as String?,
      json['updatedAt'] as String?,
    );

Map<String, dynamic> _$ProductsResponseBodyToJson(
        ProductsResponseBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'images': instance.images,
      'category': instance.category,
      'creationAt': instance.creationAt,
      'updatedAt': instance.updatedAt,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['image'] as String?,
      json['creationAt'] as String?,
      json['updatedAt'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'creationAt': instance.creationAt,
      'updatedAt': instance.updatedAt,
    };
