// To parse this JSON data, do
//
//     final transactionReport = transactionReportFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'transaction_report.g.dart';

@JsonSerializable()
class TransactionReport {
  @JsonKey(name: "has_more")
  bool? hasMore;
  @JsonKey(name: "data")
  List<TransactionReportData>? data;
  @JsonKey(name: "links")
  String? links;

  TransactionReport({
    this.hasMore,
    this.data,
    this.links,
  });

  factory TransactionReport.fromJson(Map<String, dynamic> json) =>
      _$TransactionReportFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionReportToJson(this);
}

@JsonSerializable()
class TransactionReportData {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "product_id")
  String? productId;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "channel_category")
  String? channelCategory;
  @JsonKey(name: "channel_code")
  String? channelCode;
  @JsonKey(name: "reference_id")
  String? referenceId;
  @JsonKey(name: "account_identifier")
  dynamic accountIdentifier;
  @JsonKey(name: "currency")
  String? currency;
  @JsonKey(name: "amount")
  int? amount;
  @JsonKey(name: "net_amount")
  int? netAmount;
  @JsonKey(name: "cashflow")
  String? cashflow;
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

  TransactionReportData({
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

  factory TransactionReportData.fromJson(Map<String, dynamic> json) =>
      _$TransactionReportDataFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionReportDataToJson(this);
}

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
  String? status;

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
