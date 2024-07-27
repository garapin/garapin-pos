// To parse this JSON data, do
//
//     final reportTransactionByProduct = reportTransactionByProductFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'report_transaction_by_product.g.dart';

ReportTransactionByProduct reportTransactionByProductFromJson(String str) => ReportTransactionByProduct.fromJson(json.decode(str));

String reportTransactionByProductToJson(ReportTransactionByProduct data) => json.encode(data.toJson());

@JsonSerializable()
class ReportTransactionByProduct {
  @JsonKey(name: "transactions")
  List<Transaction>? transactions;
  @JsonKey(name: "draw")
  int? draw;
  @JsonKey(name: "recordsTotal")
  int? recordsTotal;
  @JsonKey(name: "recordsFiltered")
  int? recordsFiltered;
  @JsonKey(name: "totalGrossSales")
  int? totalGrossSales;
  @JsonKey(name: "totalDiscount")
  int? totalDiscount;
  @JsonKey(name: "totalNetSales")
  int? totalNetSales;
  @JsonKey(name: "totalTransactions")
  int? totalTransactions;
  @JsonKey(name: "excelBuffer")
  String? excelBuffer;

  ReportTransactionByProduct({
    this.transactions,
    this.draw,
    this.recordsTotal,
    this.recordsFiltered,
    this.totalGrossSales,
    this.totalDiscount,
    this.totalNetSales,
    this.totalTransactions,
    this.excelBuffer,
  });

  factory ReportTransactionByProduct.fromJson(Map<String, dynamic> json) => _$ReportTransactionByProductFromJson(json);

  Map<String, dynamic> toJson() => _$ReportTransactionByProductToJson(this);
}

@JsonSerializable()
class Transaction {
  @JsonKey(name: "date")
  DateTime? date;
  @JsonKey(name: "invoice")
  String? invoice;
  @JsonKey(name: "productId")
  String? productId;
  @JsonKey(name: "productName")
  String? productName;
  @JsonKey(name: "category")
  Brands? category;
  @JsonKey(name: "brand")
  Brands? brand;
  @JsonKey(name: "quantity")
  int? quantity;
  @JsonKey(name: "grossSales")
  int? grossSales;
  @JsonKey(name: "discount")
  int? discount;
  @JsonKey(name: "totalPrice")
  int? totalPrice;
  @JsonKey(name: "totalPriceTransaction")
  int? totalPriceTransaction;

  Transaction({
    this.date,
    this.invoice,
    this.productId,
    this.productName,
    this.category,
    this.brand,
    this.quantity,
    this.grossSales,
    this.discount,
    this.totalPrice,
    this.totalPriceTransaction,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}

@JsonSerializable()
class Brands {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;

  Brands({
    this.id,
    this.name,
  });

  factory Brands.fromJson(Map<String, dynamic> json) => _$BrandsFromJson(json);

  Map<String, dynamic> toJson() => _$BrandsToJson(this);
}
