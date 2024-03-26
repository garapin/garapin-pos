// To parse this JSON data, do
//
//     final splitPaymentTemplate = splitPaymentTemplateFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'split_payment_template.g.dart';

@JsonSerializable()
class SplitPaymentTemplate {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "description")
  dynamic description;
  @JsonKey(name: "routes")
  List<RoutePayments>? routes;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "__v")
  int? v;

  SplitPaymentTemplate({
    this.id,
    this.name,
    this.description,
    this.routes,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory SplitPaymentTemplate.fromJson(Map<String, dynamic> json) =>
      _$SplitPaymentTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$SplitPaymentTemplateToJson(this);
}

@JsonSerializable()
class RoutePayments {
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "target")
  String? target;
  @JsonKey(name: "fee_pos")
  dynamic feePos;
  @JsonKey(name: "flat_amount")
  dynamic flatAmount;
  @JsonKey(name: "percent_amount")
  dynamic percentAmount;
  @JsonKey(name: "currency")
  dynamic currency;
  @JsonKey(name: "destination_account_id")
  dynamic destinationAccountId;
  @JsonKey(name: "reference_id")
  dynamic referenceId;
  @JsonKey(name: "_id")
  String? id;

  RoutePayments({
    this.type,
    this.target,
    this.feePos,
    this.flatAmount,
    this.percentAmount,
    this.currency,
    this.destinationAccountId,
    this.referenceId,
    this.id,
  });

  factory RoutePayments.fromJson(Map<String, dynamic> json) =>
      _$RoutePaymentsFromJson(json);

  Map<String, dynamic> toJson() => _$RoutePaymentsToJson(this);
}
