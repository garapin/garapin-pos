// To parse this JSON data, do
//
//     final addProduct = addProductFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'add_product.g.dart';

@JsonSerializable()
class AddProduct {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "imei")
  String? imei;
  @JsonKey(name: "no_sn")
  String? noSn;
  @JsonKey(name: "no_product")
  String? noProduct;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "created_by")
  int? createdBy;

  AddProduct({
    this.name,
    this.imei,
    this.noSn,
    this.noProduct,
    this.status,
    this.createdBy,
  });

  factory AddProduct.fromJson(Map<String, dynamic> json) =>
      _$AddProductFromJson(json);

  Map<String, dynamic> toJson() => _$AddProductToJson(this);
}
