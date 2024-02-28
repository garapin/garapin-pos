// To parse this JSON data, do
//
//     final qrCode = qrCodeFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'qrcode.g.dart';

@JsonSerializable()
class QrCode {
  @JsonKey(name: "reference_id")
  String? referenceId;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "currency")
  String? currency;
  @JsonKey(name: "channel_code")
  String? channelCode;
  @JsonKey(name: "amount")
  int? amount;
  @JsonKey(name: "expires_at")
  DateTime? expiresAt;
  @JsonKey(name: "metadata")
  dynamic metadata;
  @JsonKey(name: "business_id")
  String? businessId;
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "created")
  DateTime? created;
  @JsonKey(name: "updated")
  DateTime? updated;
  @JsonKey(name: "qr_string")
  String? qrString;
  @JsonKey(name: "status")
  String? status;

  QrCode({
    this.referenceId,
    this.type,
    this.currency,
    this.channelCode,
    this.amount,
    this.expiresAt,
    this.metadata,
    this.businessId,
    this.id,
    this.created,
    this.updated,
    this.qrString,
    this.status,
  });

  factory QrCode.fromJson(Map<String, dynamic> json) => _$QrCodeFromJson(json);

  Map<String, dynamic> toJson() => _$QrCodeToJson(this);
}
