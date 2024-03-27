// To parse this JSON data, do
//
//     final splitRule = splitRuleFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'split_rule.g.dart';

@JsonSerializable()
class SplitRule {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "id_template")
  String? idTemplate;
  @JsonKey(name: "id")
  String? splitRuleId;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;
  @JsonKey(name: "routes")
  List<Route>? routes;
  @JsonKey(name: "__v")
  int? v;

  SplitRule({
    this.id,
    this.idTemplate,
    this.splitRuleId,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.routes,
    this.v,
  });

  factory SplitRule.fromJson(Map<String, dynamic> json) =>
      _$SplitRuleFromJson(json);

  Map<String, dynamic> toJson() => _$SplitRuleToJson(this);
}

@JsonSerializable()
class Route {
  @JsonKey(name: "currency")
  String? currency;
  @JsonKey(name: "destination_account_id")
  String? destinationAccountId;
  @JsonKey(name: "reference_id")
  String? referenceId;
  @JsonKey(name: "percent_amount")
  double? percentAmount;
  @JsonKey(name: "_id")
  String? id;

  Route({
    this.currency,
    this.destinationAccountId,
    this.referenceId,
    this.percentAmount,
    this.id,
  });

  factory Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson(json);

  Map<String, dynamic> toJson() => _$RouteToJson(this);
}
