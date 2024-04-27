// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankAccount _$BankAccountFromJson(Map<String, dynamic> json) => BankAccount(
      bankName: json['bank_name'] as String?,
      holderName: json['holder_name'] as String?,
      accountNumber: json['account_number'] as String?,
      pin: json['pin'] as String?,
    );

Map<String, dynamic> _$BankAccountToJson(BankAccount instance) =>
    <String, dynamic>{
      'bank_name': instance.bankName,
      'holder_name': instance.holderName,
      'account_number': instance.accountNumber,
      'pin': instance.pin,
    };
