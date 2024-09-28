// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'add_category_response.g.dart';

@JsonSerializable()
class AddCategoriesResponseBody {
  CategoriesAllData? data;

  AddCategoriesResponseBody(
    this.data,
  );

  factory AddCategoriesResponseBody.fromJson(Map<String, dynamic> json) =>
      _$AddCategoriesResponseBodyFromJson(json);
}

@JsonSerializable()
class CategoriesAllData {
  @JsonKey(name: 'addCategory')
  CategoriesModel category;
  CategoriesAllData(this.category);
  factory CategoriesAllData.fromJson(Map<String, dynamic> json) =>
      _$CategoriesAllDataFromJson(json);
}

@JsonSerializable()
class CategoriesModel {
  String? id;
  String? name;
  String? image;
  CategoriesModel({
    this.id,
    this.name,
    this.image,
  });
  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesModelFromJson(json);
}
