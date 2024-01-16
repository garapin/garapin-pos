// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'product.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "quantity")
  int? quantity;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "code_product")
  String? codeProduct;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "created")
  DateTime? created;
  @JsonKey(name: "updated")
  DateTime? updated;

  Product({
    this.id,
    this.name,
    this.image,
    this.quantity,
    this.description,
    this.codeProduct,
    this.status,
    this.created,
    this.updated,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
