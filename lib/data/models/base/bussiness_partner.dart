// To parse this JSON data, do
//
//     final bankAccount = bankAccountFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'bussiness_partner.g.dart';

@JsonSerializable()
class BusinessPartner {
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

  BusinessPartner({
    this.companyName,
    this.noNpwp,
    this.noNib,
    this.imageNpwp,
    this.imageNib,
    this.imageAkta,
    this.status,
  });

  factory BusinessPartner.fromJson(Map<String, dynamic> json) =>
      _$BusinessPartnerFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessPartnerToJson(this);
}
