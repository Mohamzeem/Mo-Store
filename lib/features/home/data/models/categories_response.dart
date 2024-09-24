// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'categories_response.g.dart';

@JsonSerializable()
class CategoriesResponseBody {
  CategoriesAllData? data;

  CategoriesResponseBody(
    this.data,
  );

  List<CategoriesModel> get categoriesList {
    if (data!.categories.isEmpty) {
      return [];
    }
    return data!.categories.reversed.toList();
  }

  String get categoryListNumber {
    if (data!.categories.isEmpty) {
      return '0';
    }
    return data!.categories.length.toString();
  }

  factory CategoriesResponseBody.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseBodyFromJson(json);
}

@JsonSerializable()
class CategoriesAllData {
  List<CategoriesModel> categories;
  CategoriesAllData(this.categories);
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
