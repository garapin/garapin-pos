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
  String? accountNumber;
  @JsonKey(name: "pin")
  String? pin;

  ReqRegisterBank({
    this.bankName,
    this.holderName,
    this.accountNumber,
    this.pin,
  });

  factory ReqRegisterBank.fromJson(Map<String, dynamic> json) =>
      _$ReqRegisterBankFromJson(json);

  Map<String, dynamic> toJson() => _$ReqRegisterBankToJson(this);
}
