// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_transaction_by_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportTransactionByProduct _$ReportTransactionByProductFromJson(
        Map<String, dynamic> json) =>
    ReportTransactionByProduct(
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      draw: json['draw'] as int?,
      recordsTotal: json['recordsTotal'] as int?,
      recordsFiltered: json['recordsFiltered'] as int?,
      totalGrossSales: json['totalGrossSales'] as int?,
      totalDiscount: json['totalDiscount'] as int?,
      totalNetSales: json['totalNetSales'] as int?,
      totalTransactions: json['totalTransactions'] as int?,
      excelBuffer: json['excelBuffer'] as String?,
    );

Map<String, dynamic> _$ReportTransactionByProductToJson(
        ReportTransactionByProduct instance) =>
    <String, dynamic>{
      'transactions': instance.transactions,
      'draw': instance.draw,
      'recordsTotal': instance.recordsTotal,
      'recordsFiltered': instance.recordsFiltered,
      'totalGrossSales': instance.totalGrossSales,
      'totalDiscount': instance.totalDiscount,
      'totalNetSales': instance.totalNetSales,
      'totalTransactions': instance.totalTransactions,
      'excelBuffer': instance.excelBuffer,
    };

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      invoice: json['invoice'] as String?,
      productId: json['productId'] as String?,
      productName: json['productName'] as String?,
      category: json['category'] == null
          ? null
          : Brands.fromJson(json['category'] as Map<String, dynamic>),
      brand: json['brand'] == null
          ? null
          : Brands.fromJson(json['brand'] as Map<String, dynamic>),
      quantity: json['quantity'] as int?,
      grossSales: json['grossSales'] as int?,
      discount: json['discount'] as int?,
      totalPrice: json['totalPrice'] as int?,
      totalPriceTransaction: json['totalPriceTransaction'] as int?,
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'invoice': instance.invoice,
      'productId': instance.productId,
      'productName': instance.productName,
      'category': instance.category,
      'brand': instance.brand,
      'quantity': instance.quantity,
      'grossSales': instance.grossSales,
      'discount': instance.discount,
      'totalPrice': instance.totalPrice,
      'totalPriceTransaction': instance.totalPriceTransaction,
    };

Brands _$BrandsFromJson(Map<String, dynamic> json) => Brands(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$BrandsToJson(Brands instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
