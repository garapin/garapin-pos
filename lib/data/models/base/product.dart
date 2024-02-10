// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "sku")
  String? sku;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "discount")
  int? discount;
  @JsonKey(name: "price")
  double? price;
  @JsonKey(name: "brand_ref")
  BrandRef? brandRef;
  @JsonKey(name: "category_ref")
  CategoryRef? categoryRef;
  @JsonKey(name: "unit_ref")
  dynamic unitRef;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "__v")
  int? v;

  Product({
    this.id,
    this.name,
    this.sku,
    this.image,
    this.discount,
    this.price,
    this.brandRef,
    this.categoryRef,
    this.unitRef,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class BrandRef {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "brand")
  String? brand;
  @JsonKey(name: "production")
  String? production;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "__v")
  int? v;

  BrandRef({
    this.id,
    this.brand,
    this.production,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory BrandRef.fromJson(Map<String, dynamic> json) =>
      _$BrandRefFromJson(json);

  Map<String, dynamic> toJson() => _$BrandRefToJson(this);
}

@JsonSerializable()
class CategoryRef {
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

  CategoryRef({
    this.id,
    this.category,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CategoryRef.fromJson(Map<String, dynamic> json) =>
      _$CategoryRefFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryRefToJson(this);
}
