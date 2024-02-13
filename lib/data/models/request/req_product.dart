// To parse this JSON data, do
//
//     final reqProduct = reqProductFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'req_product.g.dart';

ReqProduct reqProductFromJson(String str) =>
    ReqProduct.fromJson(json.decode(str));

String reqProductToJson(ReqProduct data) => json.encode(data.toJson());

@JsonSerializable()
class ReqProduct {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "sku")
  String? sku;
  @JsonKey(name: "brand_ref")
  String? brandRef;
  @JsonKey(name: "category_ref")
  String? categoryRef;
  @JsonKey(name: "unit_ref")
  String? unitRef;
  @JsonKey(name: "discount")
  int? discount;
  @JsonKey(name: "price")
  int? price;
  @JsonKey(name: "image")
  String? image;

  ReqProduct({
    this.name,
    this.sku,
    this.brandRef,
    this.categoryRef,
    this.unitRef,
    this.discount,
    this.price,
    this.image,
  });

  factory ReqProduct.fromJson(Map<String, dynamic> json) =>
      _$ReqProductFromJson(json);

  Map<String, dynamic> toJson() => _$ReqProductToJson(this);
}
