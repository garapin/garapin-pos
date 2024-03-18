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
      companyName: json['company_name'] as String?,
      noNpwp: json['no_npwp'] as String?,
      noNib: json['no_nib'] as String?,
      imageNpwp: json['image_npwp'] as String?,
      imageNib: json['image_nib'] as String?,
      imageAkta: json['image_akta'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$ReqRegisterBankToJson(ReqRegisterBank instance) =>
    <String, dynamic>{
      'bank_name': instance.bankName,
      'holder_name': instance.holderName,
      'account_number': instance.accountNumber,
      'pin': instance.pin,
      'company_name': instance.companyName,
      'no_npwp': instance.noNpwp,
      'no_nib': instance.noNib,
      'image_npwp': instance.imageNpwp,
      'image_nib': instance.imageNib,
      'image_akta': instance.imageAkta,
      'status': instance.status,
    };
