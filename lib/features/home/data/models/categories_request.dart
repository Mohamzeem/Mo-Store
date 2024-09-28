// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'categories_request.g.dart';

@JsonSerializable()
class CategoriesRequest {
  String? id;
  String? name;
  String? image;
  CategoriesRequest({
    this.id,
    this.name,
    this.image,
  });

  Map<String, dynamic> toJson() => _$CategoriesRequestToJson(this);
}
