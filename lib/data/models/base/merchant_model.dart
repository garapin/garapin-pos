// To parse this JSON data, do
//
//     final merchantModel = merchantModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'merchant_model.g.dart';

@JsonSerializable()
class MerchantModel {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "merchant_role")
  String? merchantRole;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "email_owner")
  String? emailOwner;
  @JsonKey(name: "connection_string")
  String? connectionString;
  @JsonKey(name: "role")
  String? role;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "__v")
  int? v;

  MerchantModel({
    this.id,
    this.type,
    this.merchantRole,
    this.name,
    this.emailOwner,
    this.connectionString,
    this.role,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory MerchantModel.fromJson(Map<String, dynamic> json) =>
      _$MerchantModelFromJson(json);

  Map<String, dynamic> toJson() => _$MerchantModelToJson(this);
}
