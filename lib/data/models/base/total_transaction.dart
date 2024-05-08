// To parse this JSON data, do
//
//     final totalTransaction = totalTransactionFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'total_transaction.g.dart';

@JsonSerializable()
class TotalTransaction {
  @JsonKey(name: "total_amount")
  int? totalAmount;
  @JsonKey(name: "net_amount")
  int? netAmount;
  @JsonKey(name: "fee")
  int? fee;
  @JsonKey(name: "tax")
  int? tax;

  TotalTransaction({
    this.totalAmount,
    this.netAmount,
    this.fee,
    this.tax,
  });

  factory TotalTransaction.fromJson(Map<String, dynamic> json) =>
      _$TotalTransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TotalTransactionToJson(this);
}
