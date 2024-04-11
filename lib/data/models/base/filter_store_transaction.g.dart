// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_store_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterStoreTransaction _$FilterStoreTransactionFromJson(
        Map<String, dynamic> json) =>
    FilterStoreTransaction(
      dbName: json['db_name'] as String?,
      emailOwner: json['email_owner'] as String?,
      storeName: json['store_name'] as String?,
      accountId: json['account_id'] as String?,
      templateId: json['template_id'] as String?,
      templateName: json['template_name'] as String?,
      templateStatus: json['template_status'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
    );

Map<String, dynamic> _$FilterStoreTransactionToJson(
        FilterStoreTransaction instance) =>
    <String, dynamic>{
      'db_name': instance.dbName,
      'email_owner': instance.emailOwner,
      'store_name': instance.storeName,
      'account_id': instance.accountId,
      'template_id': instance.templateId,
      'template_name': instance.templateName,
      'template_status': instance.templateStatus,
      'created': instance.created?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
    };
