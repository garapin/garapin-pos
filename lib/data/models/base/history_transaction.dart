// To parse this JSON data, do
//
//     final historyTransaction = historyTransactionFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'history_transaction.g.dart';

// test
@JsonSerializable()
class HistoryTransaction {
  @JsonKey(name: "has_more")
  bool? hasMore;
  @JsonKey(name: "data")
  List<Datum>? data;
  @JsonKey(name: "links")
  List<Link>? links;

  HistoryTransaction({
    this.hasMore,
    this.data,
    this.links,
  });

  factory HistoryTransaction.fromJson(Map<String, dynamic> json) =>
      _$HistoryTransactionFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryTransactionToJson(this);
}

@JsonSerializable()
class Datum {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "product_id")
  String? productId;
  @JsonKey(name: "type")
  TypePayment? type;
  @JsonKey(name: "status")
  DatumStatus? status;
  @JsonKey(name: "channel_category")
  ChannelCategory? channelCategory;
  @JsonKey(name: "channel_code")
  String? channelCode;
  @JsonKey(name: "reference_id")
  String? referenceId;
  @JsonKey(name: "account_identifier")
  String? accountIdentifier;
  @JsonKey(name: "currency")
  Currency? currency;
  @JsonKey(name: "amount")
  int? amount;
  @JsonKey(name: "net_amount")
  int? netAmount;
  @JsonKey(name: "cashflow")
  Cashflow? cashflow;
  @JsonKey(name: "settlement_status")
  String? settlementStatus;
  @JsonKey(name: "estimated_settlement_time")
  DateTime? estimatedSettlementTime;
  @JsonKey(name: "business_id")
  String? businessId;
  @JsonKey(name: "created")
  DateTime? created;
  @JsonKey(name: "updated")
  DateTime? updated;
  @JsonKey(name: "fee")
  Fee? fee;

  Datum({
    this.id,
    this.productId,
    this.type,
    this.status,
    this.channelCategory,
    this.channelCode,
    this.referenceId,
    this.accountIdentifier,
    this.currency,
    this.amount,
    this.netAmount,
    this.cashflow,
    this.settlementStatus,
    this.estimatedSettlementTime,
    this.businessId,
    this.created,
    this.updated,
    this.fee,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}

enum BusinessId {
  @JsonValue("6018d6d4a4e74d169521a911")
  THE_6018_D6_D4_A4_E74_D169521_A911
}

final businessIdValues = EnumValues({
  "6018d6d4a4e74d169521a911": BusinessId.THE_6018_D6_D4_A4_E74_D169521_A911
});

enum Cashflow {
  @JsonValue("MONEY_IN")
  MONEY_IN,
  @JsonValue("MONEY_OUT")
  MONEY_OUT
}

final cashflowValues = EnumValues(
    {"MONEY_IN": Cashflow.MONEY_IN, "MONEY_OUT": Cashflow.MONEY_OUT});

enum ChannelCategory {
  @JsonValue("QR_CODE")
  QR_CODE,
  @JsonValue("BANK")
  BANK,
  @JsonValue("EWALLET")
  EWALLET,
  @JsonValue("VIRTUAL_ACCOUNT")
  VIRTUAL_ACCOUNT,
  @JsonValue("XENPLATFORM")
  XENPLATFORM
}

final channelCategoryValues = EnumValues({
  "QR_CODE": ChannelCategory.QR_CODE,
  "BANK": ChannelCategory.BANK,
  "EWALLET": ChannelCategory.EWALLET,
  "VIRTUAL_ACCOUNT": ChannelCategory.VIRTUAL_ACCOUNT,
  "XENPLATFORM": ChannelCategory.XENPLATFORM
});

enum Currency {
  @JsonValue("IDR")
  IDR
}

final currencyValues = EnumValues({"IDR": Currency.IDR});

@JsonSerializable()
class Fee {
  @JsonKey(name: "xendit_fee")
  int? xenditFee;
  @JsonKey(name: "value_added_tax")
  int? valueAddedTax;
  @JsonKey(name: "xendit_withholding_tax")
  int? xenditWithholdingTax;
  @JsonKey(name: "third_party_withholding_tax")
  int? thirdPartyWithholdingTax;
  @JsonKey(name: "status")
  FeeStatus? status;

  Fee({
    this.xenditFee,
    this.valueAddedTax,
    this.xenditWithholdingTax,
    this.thirdPartyWithholdingTax,
    this.status,
  });

  factory Fee.fromJson(Map<String, dynamic> json) => _$FeeFromJson(json);

  Map<String, dynamic> toJson() => _$FeeToJson(this);
}

enum FeeStatus {
  @JsonValue("COMPLETED")
  COMPLETED,
  @JsonValue("PENDING")
  PENDING
}

final feeStatusValues = EnumValues(
    {"COMPLETED": FeeStatus.COMPLETED, "PENDING": FeeStatus.PENDING});

enum DatumStatus {
  @JsonValue("SUCCESS")
  SUCCESS,
  @JsonValue("PENDING")
  PENDING,
}

final datumStatusValues = EnumValues(
    {"SUCCESS": DatumStatus.SUCCESS, "PENDING": DatumStatus.PENDING});

enum TypePayment {
  @JsonValue("PAYMENT")
  PAYMENT,
  @JsonValue("TRANSFER")
  TRANSFER,
  @JsonValue("DISBURSEMENT")
  DISBURSEMENT,
}

final typeValues = EnumValues({
  "PAYMENT": TypePayment.PAYMENT,
  "TRANSFER": TypePayment.TRANSFER,
  "DISBURSEMENT": TypePayment.DISBURSEMENT
});

@JsonSerializable()
class Link {
  @JsonKey(name: "href")
  String? href;
  @JsonKey(name: "method")
  String? method;
  @JsonKey(name: "rel")
  String? rel;

  Link({
    this.href,
    this.method,
    this.rel,
  });

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

  Map<String, dynamic> toJson() => _$LinkToJson(this);
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
