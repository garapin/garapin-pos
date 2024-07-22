// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amount_pending_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AmountPendingTransaction _$AmountPendingTransactionFromJson(
        Map<String, dynamic> json) =>
    AmountPendingTransaction(
      amount: json['amount'] as int?,
      costQuickRelease: json['quickReleaseCost'] as int?,
      feeUsingQR: json['feeUsingQR'] as int?,
      feeUsingVA: json['feeUsingVA'] as int?,
    )
      ..totalPaymentUsingQR = json['totalPaymentUsingQR'] as int?
      ..totalPaymentUsingVA = json['totalPaymentUsingVA'] as int?;

Map<String, dynamic> _$AmountPendingTransactionToJson(
        AmountPendingTransaction instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'quickReleaseCost': instance.costQuickRelease,
      'feeUsingQR': instance.feeUsingQR,
      'feeUsingVA': instance.feeUsingVA,
      'totalPaymentUsingQR': instance.totalPaymentUsingQR,
      'totalPaymentUsingVA': instance.totalPaymentUsingVA,
    };
