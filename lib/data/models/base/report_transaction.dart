// To parse this JSON data, do
//
//     final reportTransaction = reportTransactionFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'report_transaction.g.dart';

ReportTransaction reportTransactionFromJson(String str) => ReportTransaction.fromJson(json.decode(str));

String reportTransactionToJson(ReportTransaction data) => json.encode(data.toJson());

@JsonSerializable()
class ReportTransaction {
  @JsonKey(name: "transactions")
  List<Transaction>? transactions;
  @JsonKey(name: "totalGrossSales")
  int? totalGrossSales;
  @JsonKey(name: "totalDiscount")
  int? totalDiscount;
  @JsonKey(name: "totalNetSales")
  int? totalNetSales;
  @JsonKey(name: "draw")
  int? draw;
  @JsonKey(name: "recordsTotal")
  int? recordsTotal;
  @JsonKey(name: "recordsFiltered")
  int? recordsFiltered;
  @JsonKey(name: "excelBuffer")
  String? excelBuffer;

  ReportTransaction({
    this.transactions,
    this.totalGrossSales,
    this.totalDiscount,
    this.totalNetSales,
    this.draw,
    this.recordsTotal,
    this.recordsFiltered,
    this.excelBuffer,
  });

  factory ReportTransaction.fromJson(Map<String, dynamic> json) => _$ReportTransactionFromJson(json);

  Map<String, dynamic> toJson() => _$ReportTransactionToJson(this);
}

@JsonSerializable()
class Transaction {
  @JsonKey(name: "date")
  DateTime? date;
  @JsonKey(name: "invoice")
  String? invoice;
  @JsonKey(name: "grossSales")
  int? grossSales;
  @JsonKey(name: "discount")
  int? discount;
  @JsonKey(name: "netSales")
  int? netSales;

  Transaction({
    this.date,
    this.invoice,
    this.grossSales,
    this.discount,
    this.netSales,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
