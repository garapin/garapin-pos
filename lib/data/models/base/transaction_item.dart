// To parse this JSON data, do
//
//     final transactionItem = transactionItemFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'transaction_item.g.dart';

TransactionItem transactionItemFromJson(String str) =>
    TransactionItem.fromJson(json.decode(str));

String transactionItemToJson(TransactionItem data) =>
    json.encode(data.toJson());

@JsonSerializable()
class TransactionItem {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "id_product_item")
  int? idProductItem;
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
  int? idUser;

  TransactionItem({
    this.id,
    this.idProductItem,
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

  factory TransactionItem.fromJson(Map<String, dynamic> json) =>
      _$TransactionItemFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionItemToJson(this);
}
