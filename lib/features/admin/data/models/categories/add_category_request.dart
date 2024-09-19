// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'add_category_request.g.dart';

@JsonSerializable()
class AddCategoriesRequest {
  String? name;
  String? image;
  AddCategoriesRequest({
    this.name,
    this.image,
  });

  Map<String, dynamic> toJson() => _$AddCategoriesRequestToJson(this);
}
