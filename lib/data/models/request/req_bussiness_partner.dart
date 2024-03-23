// To parse this JSON data, do
//
//     final ReqBussinesspartner = ReqBussinesspartnerFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'req_bussiness_partner.g.dart';

@JsonSerializable()
class ReqBussinesspartner {
  @JsonKey(name: "company_name")
  String? companyName;
  @JsonKey(name: "no_npwp")
  String? noNpwp;
  @JsonKey(name: "no_nib")
  String? noNib;
  @JsonKey(name: "image_npwp")
  String? imageNpwp;
  @JsonKey(name: "image_nib")
  String? imageNib;
  @JsonKey(name: "image_akta")
  String? imageAkta;
  @JsonKey(name: "status")
  String? status;

  ReqBussinesspartner({
    this.companyName,
    this.noNpwp,
    this.noNib,
    this.imageNpwp,
    this.imageNib,
    this.imageAkta,
    this.status,
  });

  factory ReqBussinesspartner.fromJson(Map<String, dynamic> json) =>
      _$ReqBussinesspartnerFromJson(json);

  Map<String, dynamic> toJson() => _$ReqBussinesspartnerToJson(this);
}
