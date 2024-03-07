// To parse this JSON data, do
//
//     final availablePayment = availablePaymentFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'available_payment.g.dart';

AvailablePayment availablePaymentFromJson(String str) =>
    AvailablePayment.fromJson(json.decode(str));

String availablePaymentToJson(AvailablePayment data) =>
    json.encode(data.toJson());

@JsonSerializable()
class AvailablePayment {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "bank")
  String? bank;
  @JsonKey(name: "image")
  String? image;

  AvailablePayment({
    this.id,
    this.bank,
    this.image,
  });

  factory AvailablePayment.fromJson(Map<String, dynamic> json) =>
      _$AvailablePaymentFromJson(json);

  Map<String, dynamic> toJson() => _$AvailablePaymentToJson(this);
}
