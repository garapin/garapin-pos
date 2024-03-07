// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'virtual_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VirtualAccount _$VirtualAccountFromJson(Map<String, dynamic> json) =>
    VirtualAccount(
      id: json['id'] as String?,
      ownerId: json['owner_id'] as String?,
      externalId: json['external_id'] as String?,
      accountNumber: json['account_number'] as String?,
      bankCode: json['bank_code'] as String?,
      merchantCode: json['merchant_code'] as String?,
      name: json['name'] as String?,
      isClosed: json['is_closed'] as bool?,
      expectedAmount: json['expected_amount'] as int?,
      expirationDate: json['expiration_date'] == null
          ? null
          : DateTime.parse(json['expiration_date'] as String),
      isSingleUse: json['is_single_use'] as bool?,
      status: json['status'] as String?,
      currency: json['currency'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$VirtualAccountToJson(VirtualAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner_id': instance.ownerId,
      'external_id': instance.externalId,
      'account_number': instance.accountNumber,
      'bank_code': instance.bankCode,
      'merchant_code': instance.merchantCode,
      'name': instance.name,
      'is_closed': instance.isClosed,
      'expected_amount': instance.expectedAmount,
      'expiration_date': instance.expirationDate?.toIso8601String(),
      'is_single_use': instance.isSingleUse,
      'status': instance.status,
      'currency': instance.currency,
      'country': instance.country,
    };
