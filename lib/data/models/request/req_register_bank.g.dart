// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'req_register_bank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReqRegisterBank _$ReqRegisterBankFromJson(Map<String, dynamic> json) =>
    ReqRegisterBank(
      bankName: json['bank_name'] as String?,
      holderName: json['holder_name'] as String?,
      accountNumber: json['account_number'] as int?,
      pin: json['pin'] as int?,
    );

Map<String, dynamic> _$ReqRegisterBankToJson(ReqRegisterBank instance) =>
    <String, dynamic>{
      'bank_name': instance.bankName,
      'holder_name': instance.holderName,
      'account_number': instance.accountNumber,
      'pin': instance.pin,
    };
