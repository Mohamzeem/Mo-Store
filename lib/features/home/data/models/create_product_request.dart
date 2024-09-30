import 'package:json_annotation/json_annotation.dart';

part 'create_product_request.g.dart';

@JsonSerializable()
class AddProductRequest {
  String? title;
  String? description;
  double? price;
  double? categoryId;
  List<String>? images;
  AddProductRequest({
    this.title,
    this.description,
    this.price,
    this.categoryId,
    this.images,
  });

  Map<String, dynamic> toJson() => _$AddProductRequestToJson(this);
}
