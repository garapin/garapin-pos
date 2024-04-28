// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_amount_withdraw.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckAmountWithdraw _$CheckAmountWithdrawFromJson(Map<String, dynamic> json) =>
    CheckAmountWithdraw(
      amount: json['amount'] as int?,
      totalFee: json['total_fee'] as int?,
      amountToBank: json['amount_to_bank'] as int?,
    );

Map<String, dynamic> _$CheckAmountWithdrawToJson(
        CheckAmountWithdraw instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'total_fee': instance.totalFee,
      'amount_to_bank': instance.amountToBank,
    };
