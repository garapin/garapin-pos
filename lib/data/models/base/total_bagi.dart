import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'total_bagi.g.dart';

@JsonSerializable()
class TotalBagi {
  @JsonKey(name: "net_amount")
  int? netAmount;

  TotalBagi({
    this.netAmount,
  });

  factory TotalBagi.fromJson(Map<String, dynamic> json) =>
      _$TotalBagiFromJson(json);

  Map<String, dynamic> toJson() => _$TotalBagiToJson(this);
}
