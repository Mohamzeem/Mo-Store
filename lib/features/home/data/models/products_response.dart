// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'products_response.g.dart';

@JsonSerializable()
class ProductsResponseBody {
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  Category? category;
  String? creationAt;
  String? updatedAt;
  ProductsResponseBody(
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    this.category,
    this.creationAt,
    this.updatedAt,
  );

  factory ProductsResponseBody.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsResponseBodyToJson(this);
}

@JsonSerializable()
class Category {
  int? id;
  String? name;
  String? image;
  String? creationAt;
  String? updatedAt;

  Category(
    this.id,
    this.name,
    this.image,
    this.creationAt,
    this.updatedAt,
  );
  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
