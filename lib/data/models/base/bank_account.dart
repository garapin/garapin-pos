// To parse this JSON data, do
//
//     final bankAccount = bankAccountFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'bank_account.g.dart';

@JsonSerializable()
class BankAccount {
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

  BankAccount({
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

  factory BankAccount.fromJson(Map<String, dynamic> json) =>
      _$BankAccountFromJson(json);

  Map<String, dynamic> toJson() => _$BankAccountToJson(this);
}
