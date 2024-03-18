// To parse this JSON data, do
//
//     final ReqRegisterBank = ReqRegisterBankFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'req_register_bank.g.dart';

@JsonSerializable()
class ReqRegisterBank {
  @JsonKey(name: "bank_name")
  String? bankName;
  @JsonKey(name: "holder_name")
  String? holderName;
  @JsonKey(name: "account_number")
  int? accountNumber;
  @JsonKey(name: "pin")
  int? pin;
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

  ReqRegisterBank({
    this.bankName,
    this.holderName,
    this.accountNumber,
    this.pin,
    this.companyName,
    this.noNpwp,
    this.noNib,
    this.imageNpwp,
    this.imageNib,
    this.imageAkta,
    this.status,
  });

  factory ReqRegisterBank.fromJson(Map<String, dynamic> json) =>
      _$ReqRegisterBankFromJson(json);

  Map<String, dynamic> toJson() => _$ReqRegisterBankToJson(this);
}
