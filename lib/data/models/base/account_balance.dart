// To parse this JSON data, do
//
//     final accountBalance = accountBalanceFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'account_balance.g.dart';

@JsonSerializable()
class AccountBalance {
  @JsonKey(name: "balance")
  int? balance;
  @JsonKey(name: "bank")
  Bank? bank;

  AccountBalance({
    this.balance,
    this.bank,
  });

  factory AccountBalance.fromJson(Map<String, dynamic> json) =>
      _$AccountBalanceFromJson(json);

  Map<String, dynamic> toJson() => _$AccountBalanceToJson(this);
}

@JsonSerializable()
class Bank {
  @JsonKey(name: "bank_name")
  String? bankName;
  @JsonKey(name: "holder_name")
  String? holderName;
  @JsonKey(name: "account_number")
  String? accountNumber;
  @JsonKey(name: "pin")
  String? pin;

  Bank({
    this.bankName,
    this.holderName,
    this.accountNumber,
    this.pin,
  });

  factory Bank.fromJson(Map<String, dynamic> json) => _$BankFromJson(json);

  Map<String, dynamic> toJson() => _$BankToJson(this);
}
