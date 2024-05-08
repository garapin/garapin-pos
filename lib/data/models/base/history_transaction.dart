// To parse this JSON data, do
//
//     final historyTransaction = historyTransactionFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'history_transaction.g.dart';

@JsonSerializable()
class HistoryTransaction {
  @JsonKey(name: "has_more")
  bool? hasMore;
  @JsonKey(name: "data")
  List<Datum>? data;
  @JsonKey(name: "links")
  String? links;

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
  @JsonKey(name: "transaction")
  Transaction? transaction;
  @JsonKey(name: "splitPayment")
  SplitPayment? splitPayment;

  Datum({
    this.transaction,
    this.splitPayment,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class SplitPayment {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "id_template")
  String? idTemplate;
  @JsonKey(name: "invoice")
  String? invoice;
  @JsonKey(name: "id")
  String? splitPaymentId;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;
  @JsonKey(name: "routes")
  List<Route>? routes;
  @JsonKey(name: "__v")
  int? v;

  SplitPayment({
    this.id,
    this.idTemplate,
    this.invoice,
    this.splitPaymentId,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.routes,
    this.v,
  });

  factory SplitPayment.fromJson(Map<String, dynamic> json) =>
      _$SplitPaymentFromJson(json);

  Map<String, dynamic> toJson() => _$SplitPaymentToJson(this);
}

@JsonSerializable()
class Route {
  @JsonKey(name: "currency")
  String? currency;
  @JsonKey(name: "destination_account_id")
  String? destinationAccountId;
  @JsonKey(name: "reference_id")
  String? referenceId;
  @JsonKey(name: "flat_amount")
  int? flatAmount;
  @JsonKey(name: "target")
  String? target;
  @JsonKey(name: "role")
  String? role;
  @JsonKey(name: "fee")
  int? fee;
  @JsonKey(name: "_id")
  String? id;

  Route({
    this.currency,
    this.destinationAccountId,
    this.referenceId,
    this.flatAmount,
    this.target,
    this.role,
    this.fee,
    this.id,
  });

  factory Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson(json);

  Map<String, dynamic> toJson() => _$RouteToJson(this);
}

@JsonSerializable()
class Transaction {
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

  Transaction({
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

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
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
