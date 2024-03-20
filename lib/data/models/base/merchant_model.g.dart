// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantModel _$MerchantModelFromJson(Map<String, dynamic> json) =>
    MerchantModel(
      id: json['_id'] as String?,
      type: json['type'] as String?,
      merchantRole: json['merchant_role'] as String?,
      name: json['name'] as String?,
      emailOwner: json['email_owner'] as String?,
      connectionString: json['connection_string'] as String?,
      role: json['role'] as String?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$MerchantModelToJson(MerchantModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'type': instance.type,
      'merchant_role': instance.merchantRole,
      'name': instance.name,
      'email_owner': instance.emailOwner,
      'connection_string': instance.connectionString,
      'role': instance.role,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };
