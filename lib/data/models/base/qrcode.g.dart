// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qrcode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QrCode _$QrCodeFromJson(Map<String, dynamic> json) => QrCode(
      referenceId: json['reference_id'] as String?,
      type: json['type'] as String?,
      currency: json['currency'] as String?,
      channelCode: json['channel_code'] as String?,
      amount: json['amount'] as int?,
      expiresAt: json['expires_at'] == null
          ? null
          : DateTime.parse(json['expires_at'] as String),
      metadata: json['metadata'],
      businessId: json['business_id'] as String?,
      id: json['id'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
      qrString: json['qr_string'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$QrCodeToJson(QrCode instance) => <String, dynamic>{
      'reference_id': instance.referenceId,
      'type': instance.type,
      'currency': instance.currency,
      'channel_code': instance.channelCode,
      'amount': instance.amount,
      'expires_at': instance.expiresAt?.toIso8601String(),
      'metadata': instance.metadata,
      'business_id': instance.businessId,
      'id': instance.id,
      'created': instance.created?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
      'qr_string': instance.qrString,
      'status': instance.status,
    };
