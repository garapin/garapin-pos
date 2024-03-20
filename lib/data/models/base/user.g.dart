// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['_id'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      storeDatabaseName: (json['store_database_name'] as List<dynamic>?)
          ?.map((e) => StoreDatabaseName.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'store_database_name': instance.storeDatabaseName,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
      'token': instance.token,
    };

StoreDatabaseName _$StoreDatabaseNameFromJson(Map<String, dynamic> json) =>
    StoreDatabaseName(
      type: json['type'] as String?,
      merchantRole: json['merchant_role'] as String?,
      name: json['name'] as String?,
      conncetionString: json['conncetion_string'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$StoreDatabaseNameToJson(StoreDatabaseName instance) =>
    <String, dynamic>{
      'type': instance.type,
      'merchant_role': instance.merchantRole,
      'name': instance.name,
      'conncetion_string': instance.conncetionString,
      'role': instance.role,
    };
