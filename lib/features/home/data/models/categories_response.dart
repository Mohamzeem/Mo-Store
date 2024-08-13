// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'categories_response.g.dart';

@JsonSerializable()
class CategoriesResponseBody {
  int? id;
  String? name;
  String? image;
  String? creationAt;
  String? updatedAt;
  CategoriesResponseBody(
    this.id,
    this.name,
    this.image,
    this.creationAt,
    this.updatedAt,
  );

  factory CategoriesResponseBody.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseBodyFromJson(json);
}
