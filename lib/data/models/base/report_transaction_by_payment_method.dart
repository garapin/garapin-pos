// To parse this JSON data, do
//
//     final reportTransactionByPaymentMethod = reportTransactionByPaymentMethodFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'report_transaction_by_payment_method.g.dart';

ReportTransactionByPaymentMethod reportTransactionByPaymentMethodFromJson(String str) => ReportTransactionByPaymentMethod.fromJson(json.decode(str));

String reportTransactionByPaymentMethodToJson(ReportTransactionByPaymentMethod data) => json.encode(data.toJson());

@JsonSerializable()
class ReportTransactionByPaymentMethod {
  @JsonKey(name: "transactions")
  List<Transaction>? transactions;
  @JsonKey(name: "totalCash")
  int? totalCash;
  @JsonKey(name: "totalQris")
  int? totalQris;
  @JsonKey(name: "totalVa")
  int? totalVa;
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

  ReportTransactionByPaymentMethod({
    this.transactions,
    this.totalCash,
    this.totalQris,
    this.totalVa,
    this.totalNetSales,
    this.draw,
    this.recordsTotal,
    this.recordsFiltered,
    this.excelBuffer,
  });

  factory ReportTransactionByPaymentMethod.fromJson(Map<String, dynamic> json) => _$ReportTransactionByPaymentMethodFromJson(json);

  Map<String, dynamic> toJson() => _$ReportTransactionByPaymentMethodToJson(this);
}

@JsonSerializable()
class Transaction {
  @JsonKey(name: "date")
  DateTime? date;
  @JsonKey(name: "grossSales")
  int? grossSales;
  @JsonKey(name: "discount")
  int? discount;
  @JsonKey(name: "netSales")
  int? netSales;
  @JsonKey(name: "paymentMethod")
  String? paymentMethod;

  Transaction({
    this.date,
    this.grossSales,
    this.discount,
    this.netSales,
    this.paymentMethod,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
