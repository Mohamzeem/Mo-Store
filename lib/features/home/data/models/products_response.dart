// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'products_response.g.dart';

@JsonSerializable()
class ProductsResponseBody {
  int? id;
  String? name;
  String? image;
  String? creationAt;
  String? updatedAt;
  ProductsResponseBody(
    this.id,
    this.name,
    this.image,
    this.creationAt,
    this.updatedAt,
  );

  factory ProductsResponseBody.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseBodyFromJson(json);
}
