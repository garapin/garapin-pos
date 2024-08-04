// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_transaction_bagi_bagi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportTransactionBagiBagi _$ReportTransactionBagiBagiFromJson(
        Map<String, dynamic> json) =>
    ReportTransactionBagiBagi(
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      draw: json['draw'] as int?,
      recordsTotal: json['recordsTotal'] as int?,
      recordsFiltered: json['recordsFiltered'] as int?,
      totalBagiBagiPendapatan: json['totalBagiBagiPendapatan'] as int?,
      totalBagiBagiBiaya: json['totalBagiBagiBiaya'] as int?,
      totalNetSales: json['totalNetSales'] as int?,
      totalTransaction: json['totalTransaction'] as int?,
      excelBuffer: json['excelBuffer'] as String?,
    );

Map<String, dynamic> _$ReportTransactionBagiBagiToJson(
        ReportTransactionBagiBagi instance) =>
    <String, dynamic>{
      'transactions': instance.transactions,
      'draw': instance.draw,
      'recordsTotal': instance.recordsTotal,
      'recordsFiltered': instance.recordsFiltered,
      'totalBagiBagiPendapatan': instance.totalBagiBagiPendapatan,
      'totalBagiBagiBiaya': instance.totalBagiBagiBiaya,
      'totalNetSales': instance.totalNetSales,
      'totalTransaction': instance.totalTransaction,
      'excelBuffer': instance.excelBuffer,
    };

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      invoice: json['invoice'] as String?,
      status: json['status'] as String?,
      type: json['type'] as String?,
      target: json['target'] as String?,
      netSales: json['netSales'] as int?,
      costBagiBagiPos: json['costBagiBagiPOS'] as int?,
      percentageBagiBagiBiaya: json['percentageBagiBagiBiaya'] as int?,
      percentageFeePos: json['percentageFeePos'] as int?,
      bagiBagiBiaya: json['bagiBagiBiaya'] as int?,
      bagiBagiPendapatan: json['bagiBagiPendapatan'] as int?,
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'invoice': instance.invoice,
      'status': instance.status,
      'type': instance.type,
      'target': instance.target,
      'netSales': instance.netSales,
      'costBagiBagiPOS': instance.costBagiBagiPos,
      'percentageBagiBagiBiaya': instance.percentageBagiBagiBiaya,
      'percentageFeePos': instance.percentageFeePos,
      'bagiBagiBiaya': instance.bagiBagiBiaya,
      'bagiBagiPendapatan': instance.bagiBagiPendapatan,
    };
