// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'item.g.dart';

Item itemFromJson(String str) => Item.fromJson(json.decode(str));

String itemToJson(Item data) => json.encode(data.toJson());

@JsonSerializable()
class Item {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "id_product")
  int? idProduct;
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
  @JsonKey(name: "created")
  DateTime? created;
  @JsonKey(name: "updated")
  DateTime? updated;
  @JsonKey(name: "id_user")
  String? idUser;

  Item({
    this.id,
    this.idProduct,
    this.name,
    this.imei,
    this.noSn,
    this.noProduct,
    this.status,
    this.created,
    this.updated,
    this.idUser,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
