// To parse this JSON data, do
//
//     final virtualAccount = virtualAccountFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'virtual_account.g.dart';

@JsonSerializable()
class VirtualAccount {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "owner_id")
  String? ownerId;
  @JsonKey(name: "external_id")
  String? externalId;
  @JsonKey(name: "account_number")
  String? accountNumber;
  @JsonKey(name: "bank_code")
  String? bankCode;
  @JsonKey(name: "merchant_code")
  String? merchantCode;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "is_closed")
  bool? isClosed;
  @JsonKey(name: "expected_amount")
  int? expectedAmount;
  @JsonKey(name: "expiration_date")
  DateTime? expirationDate;
  @JsonKey(name: "is_single_use")
  bool? isSingleUse;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "currency")
  String? currency;
  @JsonKey(name: "country")
  String? country;

  VirtualAccount({
    this.id,
    this.ownerId,
    this.externalId,
    this.accountNumber,
    this.bankCode,
    this.merchantCode,
    this.name,
    this.isClosed,
    this.expectedAmount,
    this.expirationDate,
    this.isSingleUse,
    this.status,
    this.currency,
    this.country,
  });

  factory VirtualAccount.fromJson(Map<String, dynamic> json) =>
      _$VirtualAccountFromJson(json);

  Map<String, dynamic> toJson() => _$VirtualAccountToJson(this);
}
