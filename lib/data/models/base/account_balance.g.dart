// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountBalance _$AccountBalanceFromJson(Map<String, dynamic> json) =>
    AccountBalance(
      balance: json['balance'] as int?,
      bank: json['bank'] == null
          ? null
          : Bank.fromJson(json['bank'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccountBalanceToJson(AccountBalance instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'bank': instance.bank,
    };

Bank _$BankFromJson(Map<String, dynamic> json) => Bank(
      bankName: json['bank_name'] as String?,
      holderName: json['holder_name'] as String?,
      accountNumber: json['account_number'] as int?,
      pin: json['pin'] as String?,
    );

Map<String, dynamic> _$BankToJson(Bank instance) => <String, dynamic>{
      'bank_name': instance.bankName,
      'holder_name': instance.holderName,
      'account_number': instance.accountNumber,
      'pin': instance.pin,
    };
