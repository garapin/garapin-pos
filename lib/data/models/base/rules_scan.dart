// To parse this JSON data, do
//
//     final rulesScan = rulesScanFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'rules_scan.g.dart';

@JsonSerializable()
class RulesScan {
  @JsonKey(name: "scan_imei")
  String? scanImei;
  @JsonKey(name: "scan_sn")
  String? scanSn;

  RulesScan({
    this.scanImei,
    this.scanSn,
  });

  factory RulesScan.fromJson(Map<String, dynamic> json) =>
      _$RulesScanFromJson(json);

  Map<String, dynamic> toJson() => _$RulesScanToJson(this);
}
