// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TotalTransaction _$TotalTransactionFromJson(Map<String, dynamic> json) =>
    TotalTransaction(
      totalAmount: json['total_amount'] as int?,
      netAmount: json['net_amount'] as int?,
      fee: json['fee'] as int?,
      tax: json['tax'] as int?,
    );

Map<String, dynamic> _$TotalTransactionToJson(TotalTransaction instance) =>
    <String, dynamic>{
      'total_amount': instance.totalAmount,
      'net_amount': instance.netAmount,
      'fee': instance.fee,
      'tax': instance.tax,
    };
