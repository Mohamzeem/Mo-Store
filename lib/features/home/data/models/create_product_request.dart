import 'package:json_annotation/json_annotation.dart';

part 'create_product_request.g.dart';

@JsonSerializable()
class CreateProductRequest {
  String? title;
  String? description;
  double? price;
  double? categoryId;
  List<String>? images;
  CreateProductRequest({
    this.title,
    this.description,
    this.price,
    this.categoryId,
    this.images,
  });

  Map<String, dynamic> toJson() => _$CreateProductRequestToJson(this);
}
