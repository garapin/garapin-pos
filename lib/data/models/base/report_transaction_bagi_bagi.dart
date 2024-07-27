// To parse this JSON data, do
//
//     final reportTransactionBagiBagi = reportTransactionBagiBagiFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'report_transaction_bagi_bagi.g.dart';

ReportTransactionBagiBagi reportTransactionBagiBagiFromJson(String str) => ReportTransactionBagiBagi.fromJson(json.decode(str));

String reportTransactionBagiBagiToJson(ReportTransactionBagiBagi data) => json.encode(data.toJson());

@JsonSerializable()
class ReportTransactionBagiBagi {
  @JsonKey(name: "transactions")
  List<Transaction>? transactions;
  @JsonKey(name: "draw")
  int? draw;
  @JsonKey(name: "recordsTotal")
  int? recordsTotal;
  @JsonKey(name: "recordsFiltered")
  int? recordsFiltered;
  @JsonKey(name: "totalBagiBagiPendapatan")
  int? totalBagiBagiPendapatan;
  @JsonKey(name: "totalBagiBagiBiaya")
  int? totalBagiBagiBiaya;
  @JsonKey(name: "totalNetSales")
  int? totalNetSales;
  @JsonKey(name: "totalTransaction")
  int? totalTransaction;
  @JsonKey(name: "excelBuffer")
  String? excelBuffer;

  ReportTransactionBagiBagi({
    this.transactions,
    this.draw,
    this.recordsTotal,
    this.recordsFiltered,
    this.totalBagiBagiPendapatan,
    this.totalBagiBagiBiaya,
    this.totalNetSales,
    this.totalTransaction,
    this.excelBuffer,
  });

  factory ReportTransactionBagiBagi.fromJson(Map<String, dynamic> json) => _$ReportTransactionBagiBagiFromJson(json);

  Map<String, dynamic> toJson() => _$ReportTransactionBagiBagiToJson(this);
}

@JsonSerializable()
class Transaction {
  @JsonKey(name: "date")
  DateTime? date;
  @JsonKey(name: "invoice")
  String? invoice;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "target")
  String? target;
  @JsonKey(name: "netSales")
  int? netSales;
  @JsonKey(name: "costBagiBagiPOS")
  int? costBagiBagiPos;
  @JsonKey(name: "percentageBagiBagiBiaya")
  int? percentageBagiBagiBiaya;
  @JsonKey(name: "percentageFeePos")
  int? percentageFeePos;
  @JsonKey(name: "bagiBagiBiaya")
  int? bagiBagiBiaya;
  @JsonKey(name: "bagiBagiPendapatan")
  int? bagiBagiPendapatan;

  Transaction({
    this.date,
    this.invoice,
    this.status,
    this.type,
    this.target,
    this.netSales,
    this.costBagiBagiPos,
    this.percentageBagiBagiBiaya,
    this.percentageFeePos,
    this.bagiBagiBiaya,
    this.bagiBagiPendapatan,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
