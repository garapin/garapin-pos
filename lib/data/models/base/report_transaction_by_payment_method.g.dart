// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_transaction_by_payment_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportTransactionByPaymentMethod _$ReportTransactionByPaymentMethodFromJson(
        Map<String, dynamic> json) =>
    ReportTransactionByPaymentMethod(
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCash: json['totalCash'] as int?,
      totalQris: json['totalQris'] as int?,
      totalVa: json['totalVa'] as int?,
      totalNetSales: json['totalNetSales'] as int?,
      draw: json['draw'] as int?,
      recordsTotal: json['recordsTotal'] as int?,
      recordsFiltered: json['recordsFiltered'] as int?,
      excelBuffer: json['excelBuffer'] as String?,
    );

Map<String, dynamic> _$ReportTransactionByPaymentMethodToJson(
        ReportTransactionByPaymentMethod instance) =>
    <String, dynamic>{
      'transactions': instance.transactions,
      'totalCash': instance.totalCash,
      'totalQris': instance.totalQris,
      'totalVa': instance.totalVa,
      'totalNetSales': instance.totalNetSales,
      'draw': instance.draw,
      'recordsTotal': instance.recordsTotal,
      'recordsFiltered': instance.recordsFiltered,
      'excelBuffer': instance.excelBuffer,
    };

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      grossSales: json['grossSales'] as int?,
      discount: json['discount'] as int?,
      netSales: json['netSales'] as int?,
      paymentMethod: json['paymentMethod'] as String?,
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'grossSales': instance.grossSales,
      'discount': instance.discount,
      'netSales': instance.netSales,
      'paymentMethod': instance.paymentMethod,
    };
