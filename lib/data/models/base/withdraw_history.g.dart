// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraw_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithdrawHistory _$WithdrawHistoryFromJson(Map<String, dynamic> json) =>
    WithdrawHistory(
      id: json['_id'] as String?,
      withdrawHistoryId: json['id'] as String?,
      amount: json['amount'] as int?,
      channelCode: json['channel_code'] as String?,
      currency: json['currency'] as String?,
      description: json['description'] as String?,
      referenceId: json['reference_id'] as String?,
      status: json['status'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
      estimatedArrivalTime: json['estimated_arrival_time'] == null
          ? null
          : DateTime.parse(json['estimated_arrival_time'] as String),
      businessId: json['business_id'] as String?,
      channelProperties: json['channel_properties'] == null
          ? null
          : ChannelProperties.fromJson(
              json['channel_properties'] as Map<String, dynamic>),
      receiptNotification: json['receipt_notification'] == null
          ? null
          : WithdrawHistoryReceiptNotification.fromJson(
              json['receipt_notification'] as Map<String, dynamic>),
      webhook: json['webhook'] == null
          ? null
          : Webhook.fromJson(json['webhook'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$WithdrawHistoryToJson(WithdrawHistory instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'id': instance.withdrawHistoryId,
      'amount': instance.amount,
      'channel_code': instance.channelCode,
      'currency': instance.currency,
      'description': instance.description,
      'reference_id': instance.referenceId,
      'status': instance.status,
      'created': instance.created?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
      'estimated_arrival_time':
          instance.estimatedArrivalTime?.toIso8601String(),
      'business_id': instance.businessId,
      'channel_properties': instance.channelProperties,
      'receipt_notification': instance.receiptNotification,
      'webhook': instance.webhook,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };

ChannelProperties _$ChannelPropertiesFromJson(Map<String, dynamic> json) =>
    ChannelProperties(
      accountNumber: json['account_number'] as String?,
      accountHolderName: json['account_holder_name'] as String?,
    );

Map<String, dynamic> _$ChannelPropertiesToJson(ChannelProperties instance) =>
    <String, dynamic>{
      'account_number': instance.accountNumber,
      'account_holder_name': instance.accountHolderName,
    };

WithdrawHistoryReceiptNotification _$WithdrawHistoryReceiptNotificationFromJson(
        Map<String, dynamic> json) =>
    WithdrawHistoryReceiptNotification(
      emailTo: (json['email_to'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$WithdrawHistoryReceiptNotificationToJson(
        WithdrawHistoryReceiptNotification instance) =>
    <String, dynamic>{
      'email_to': instance.emailTo,
    };

Webhook _$WebhookFromJson(Map<String, dynamic> json) => Webhook(
      event: json['event'] as String?,
      businessId: json['business_id'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WebhookToJson(Webhook instance) => <String, dynamic>{
      'event': instance.event,
      'business_id': instance.businessId,
      'created': instance.created?.toIso8601String(),
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
      referenceId: json['reference_id'] as String?,
      businessId: json['business_id'] as String?,
      channelCode: json['channel_code'] as String?,
      channelProperties: json['channel_properties'] == null
          ? null
          : ChannelProperties.fromJson(
              json['channel_properties'] as Map<String, dynamic>),
      currency: json['currency'] as String?,
      amount: json['amount'] as int?,
      description: json['description'] as String?,
      receiptNotification: json['receipt_notification'] == null
          ? null
          : DataReceiptNotification.fromJson(
              json['receipt_notification'] as Map<String, dynamic>),
      status: json['status'] as String?,
      estimatedArrivalTime: json['estimated_arrival_time'] == null
          ? null
          : DateTime.parse(json['estimated_arrival_time'] as String),
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'created': instance.created?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
      'reference_id': instance.referenceId,
      'business_id': instance.businessId,
      'channel_code': instance.channelCode,
      'channel_properties': instance.channelProperties,
      'currency': instance.currency,
      'amount': instance.amount,
      'description': instance.description,
      'receipt_notification': instance.receiptNotification,
      'status': instance.status,
      'estimated_arrival_time':
          instance.estimatedArrivalTime?.toIso8601String(),
      'metadata': instance.metadata,
    };

Metadata _$MetadataFromJson(Map<String, dynamic> json) => Metadata(
      branchLocation: json['branch_location'] as String?,
    );

Map<String, dynamic> _$MetadataToJson(Metadata instance) => <String, dynamic>{
      'branch_location': instance.branchLocation,
    };

DataReceiptNotification _$DataReceiptNotificationFromJson(
        Map<String, dynamic> json) =>
    DataReceiptNotification(
      emailTo: (json['email_to'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      emailCc: (json['email_cc'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$DataReceiptNotificationToJson(
        DataReceiptNotification instance) =>
    <String, dynamic>{
      'email_to': instance.emailTo,
      'email_cc': instance.emailCc,
    };
