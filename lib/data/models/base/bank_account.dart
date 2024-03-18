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

  BankAccount({
    this.bankName,
    this.holderName,
    this.accountNumber,
    this.pin,
  });

  factory BankAccount.fromJson(Map<String, dynamic> json) =>
      _$BankAccountFromJson(json);

  Map<String, dynamic> toJson() => _$BankAccountToJson(this);
}
