// To parse this JSON data, do
//
//     final withdrawHistory = withdrawHistoryFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'withdraw_history.g.dart';

@JsonSerializable()
class WithdrawHistory {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "id")
  String? withdrawHistoryId;
  @JsonKey(name: "amount")
  int? amount;
  @JsonKey(name: "channel_code")
  String? channelCode;
  @JsonKey(name: "currency")
  String? currency;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "reference_id")
  String? referenceId;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "created")
  DateTime? created;
  @JsonKey(name: "updated")
  DateTime? updated;
  @JsonKey(name: "estimated_arrival_time")
  DateTime? estimatedArrivalTime;
  @JsonKey(name: "business_id")
  String? businessId;
  @JsonKey(name: "channel_properties")
  ChannelProperties? channelProperties;
  @JsonKey(name: "receipt_notification")
  WithdrawHistoryReceiptNotification? receiptNotification;
  @JsonKey(name: "webhook")
  Webhook? webhook;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "__v")
  int? v;

  WithdrawHistory({
    this.id,
    this.withdrawHistoryId,
    this.amount,
    this.channelCode,
    this.currency,
    this.description,
    this.referenceId,
    this.status,
    this.created,
    this.updated,
    this.estimatedArrivalTime,
    this.businessId,
    this.channelProperties,
    this.receiptNotification,
    this.webhook,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory WithdrawHistory.fromJson(Map<String, dynamic> json) =>
      _$WithdrawHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$WithdrawHistoryToJson(this);
}

@JsonSerializable()
class ChannelProperties {
  @JsonKey(name: "account_number")
  String? accountNumber;
  @JsonKey(name: "account_holder_name")
  String? accountHolderName;

  ChannelProperties({
    this.accountNumber,
    this.accountHolderName,
  });

  factory ChannelProperties.fromJson(Map<String, dynamic> json) =>
      _$ChannelPropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelPropertiesToJson(this);
}

@JsonSerializable()
class WithdrawHistoryReceiptNotification {
  @JsonKey(name: "email_to")
  List<String>? emailTo;

  WithdrawHistoryReceiptNotification({
    this.emailTo,
  });

  factory WithdrawHistoryReceiptNotification.fromJson(
          Map<String, dynamic> json) =>
      _$WithdrawHistoryReceiptNotificationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$WithdrawHistoryReceiptNotificationToJson(this);
}

@JsonSerializable()
class Webhook {
  @JsonKey(name: "event")
  String? event;
  @JsonKey(name: "business_id")
  String? businessId;
  @JsonKey(name: "created")
  DateTime? created;
  @JsonKey(name: "data")
  Data? data;

  Webhook({
    this.event,
    this.businessId,
    this.created,
    this.data,
  });

  factory Webhook.fromJson(Map<String, dynamic> json) =>
      _$WebhookFromJson(json);

  Map<String, dynamic> toJson() => _$WebhookToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "created")
  DateTime? created;
  @JsonKey(name: "updated")
  DateTime? updated;
  @JsonKey(name: "reference_id")
  String? referenceId;
  @JsonKey(name: "business_id")
  String? businessId;
  @JsonKey(name: "channel_code")
  String? channelCode;
  @JsonKey(name: "channel_properties")
  ChannelProperties? channelProperties;
  @JsonKey(name: "currency")
  String? currency;
  @JsonKey(name: "amount")
  int? amount;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "receipt_notification")
  DataReceiptNotification? receiptNotification;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "estimated_arrival_time")
  DateTime? estimatedArrivalTime;
  @JsonKey(name: "metadata")
  Metadata? metadata;

  Data({
    this.id,
    this.created,
    this.updated,
    this.referenceId,
    this.businessId,
    this.channelCode,
    this.channelProperties,
    this.currency,
    this.amount,
    this.description,
    this.receiptNotification,
    this.status,
    this.estimatedArrivalTime,
    this.metadata,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Metadata {
  @JsonKey(name: "branch_location")
  String? branchLocation;

  Metadata({
    this.branchLocation,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}

@JsonSerializable()
class DataReceiptNotification {
  @JsonKey(name: "email_to")
  List<String>? emailTo;
  @JsonKey(name: "email_cc")
  List<String>? emailCc;

  DataReceiptNotification({
    this.emailTo,
    this.emailCc,
  });

  factory DataReceiptNotification.fromJson(Map<String, dynamic> json) =>
      _$DataReceiptNotificationFromJson(json);

  Map<String, dynamic> toJson() => _$DataReceiptNotificationToJson(this);
}
