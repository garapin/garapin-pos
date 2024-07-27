// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportTransaction _$ReportTransactionFromJson(Map<String, dynamic> json) =>
    ReportTransaction(
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalGrossSales: json['totalGrossSales'] as int?,
      totalDiscount: json['totalDiscount'] as int?,
      totalNetSales: json['totalNetSales'] as int?,
      draw: json['draw'] as int?,
      recordsTotal: json['recordsTotal'] as int?,
      recordsFiltered: json['recordsFiltered'] as int?,
      excelBuffer: json['excelBuffer'] as String?,
    );

Map<String, dynamic> _$ReportTransactionToJson(ReportTransaction instance) =>
    <String, dynamic>{
      'transactions': instance.transactions,
      'totalGrossSales': instance.totalGrossSales,
      'totalDiscount': instance.totalDiscount,
      'totalNetSales': instance.totalNetSales,
      'draw': instance.draw,
      'recordsTotal': instance.recordsTotal,
      'recordsFiltered': instance.recordsFiltered,
      'excelBuffer': instance.excelBuffer,
    };

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      invoice: json['invoice'] as String?,
      grossSales: json['grossSales'] as int?,
      discount: json['discount'] as int?,
      netSales: json['netSales'] as int?,
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'invoice': instance.invoice,
      'grossSales': instance.grossSales,
      'discount': instance.discount,
      'netSales': instance.netSales,
    };
