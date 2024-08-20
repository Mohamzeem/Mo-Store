// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'favorit_model.g.dart';

@HiveType(typeId: 1)
class FavoritModel extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  int? price;
  @HiveField(3)
  String? description;
  @HiveField(4)
  List<String>? images;

  FavoritModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
  });
}
