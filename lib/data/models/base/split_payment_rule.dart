// To parse this JSON data, do
//
//     final splitPaymentRule = splitPaymentRuleFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'split_payment_rule.g.dart';

@JsonSerializable()
class SplitPaymentRule {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "routes")
  List<RoutePayments>? routes;

  SplitPaymentRule({
    this.name,
    this.description,
    this.routes,
  });

  factory SplitPaymentRule.fromJson(Map<String, dynamic> json) =>
      _$SplitPaymentRuleFromJson(json);

  Map<String, dynamic> toJson() => _$SplitPaymentRuleToJson(this);
}

@JsonSerializable()
class RoutePayments {
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "target")
  String? target;
  @JsonKey(name: "fee_pos")
  int? feePos;
  @JsonKey(name: "flat_amount")
  int? flatAmount;
  @JsonKey(name: "percent_amount")
  int? percentAmount;
  @JsonKey(name: "currency")
  String? currency;
  @JsonKey(name: "destination_account_id")
  String? destinationAccountId;
  @JsonKey(name: "reference_id")
  String? referenceId;

  RoutePayments({
    this.type,
    this.target,
    this.feePos,
    this.flatAmount,
    this.percentAmount,
    this.currency,
    this.destinationAccountId,
    this.referenceId,
  });

  factory RoutePayments.fromJson(Map<String, dynamic> json) =>
      _$RoutePaymentsFromJson(json);

  Map<String, dynamic> toJson() => _$RoutePaymentsToJson(this);
}
