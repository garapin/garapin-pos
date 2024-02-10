import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class CategoryProduct {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "category")
  String? category;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "__v")
  int? v;

  CategoryProduct({
    this.id,
    this.category,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CategoryProduct.fromJson(Map<String, dynamic> json) =>
      _$CategoryProductFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryProductToJson(this);
}
