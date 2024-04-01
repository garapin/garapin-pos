// To parse this JSON data, do
//
//     final databaseStore = databaseStoreFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'package:pos/data/models/base/user.dart';
import 'dart:convert';

import 'store.dart';

part 'database_store.g.dart';

@JsonSerializable()
class DatabaseStore {
  @JsonKey(name: "user")
  User? user;
  @JsonKey(name: "dbName")
  String? dbName;
  @JsonKey(name: "email_owner")
  String? emailOwner;
  @JsonKey(name: "storesData")
  StoresData? storesData;

  DatabaseStore({
    this.dbName,
    this.storesData,
  });

  factory DatabaseStore.fromJson(Map<String, dynamic> json) =>
      _$DatabaseStoreFromJson(json);

  Map<String, dynamic> toJson() => _$DatabaseStoreToJson(this);
}

@JsonSerializable()
class StoresData {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "store_type")
  String? storeType;
  @JsonKey(name: "merchant_role")
  String? merchantRole;
  @JsonKey(name: "id_parent")
  String? idParent;
  @JsonKey(name: "store_name")
  String? storeName;
  @JsonKey(name: "store_status")
  String? storeStatus;
  @JsonKey(name: "pic_name")
  String? picName;
  @JsonKey(name: "address")
  String? address;
  @JsonKey(name: "state")
  String? state;
  @JsonKey(name: "city")
  String? city;
  @JsonKey(name: "country")
  String? country;
  @JsonKey(name: "postal_code")
  String? postalCode;
  @JsonKey(name: "store_image")
  dynamic storeImage;
  @JsonKey(name: "business_partner")
  BusinessPartner? businessPartner;
  @JsonKey(name: "bank_account")
  BankAccount? bankAccount;
  @JsonKey(name: "account_holder")
  AccountHolder? accountHolder;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "__v")
  int? v;
  @JsonKey(name: "phone_number")
  String? phoneNumber;

  StoresData({
    this.id,
    this.storeType,
    this.merchantRole,
    this.idParent,
    this.storeName,
    this.storeStatus,
    this.picName,
    this.address,
    this.state,
    this.city,
    this.country,
    this.postalCode,
    this.storeImage,
    this.businessPartner,
    this.bankAccount,
    this.accountHolder,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.phoneNumber,
  });

  factory StoresData.fromJson(Map<String, dynamic> json) =>
      _$StoresDataFromJson(json);

  Map<String, dynamic> toJson() => _$StoresDataToJson(this);
}

@JsonSerializable()
class PublicProfile {
  @JsonKey(name: "business_name")
  String? businessName;

  PublicProfile({
    this.businessName,
  });

  factory PublicProfile.fromJson(Map<String, dynamic> json) =>
      _$PublicProfileFromJson(json);

  Map<String, dynamic> toJson() => _$PublicProfileToJson(this);
}

@JsonSerializable()
class BankAccount {
  @JsonKey(name: "bank_name")
  dynamic bankName;
  @JsonKey(name: "holder_name")
  dynamic holderName;
  @JsonKey(name: "account_number")
  dynamic accountNumber;
  @JsonKey(name: "pin")
  dynamic pin;

  BankAccount({
    this.bankName,
    this.holderName,
    this.accountNumber,
    this.pin,
  });

  factory BankAccount.fromJson(Map<String, dynamic> json) =>
      _$BankAccountFromJson(json);

  Map<String, dynamic> toJson() => _$BankAccountToJson(this);
}

@JsonSerializable()
class BusinessPartner {
  @JsonKey(name: "company_name")
  dynamic companyName;
  @JsonKey(name: "no_npwp")
  dynamic noNpwp;
  @JsonKey(name: "no_nib")
  dynamic noNib;
  @JsonKey(name: "image_npwp")
  dynamic imageNpwp;
  @JsonKey(name: "image_nib")
  dynamic imageNib;
  @JsonKey(name: "image_akta")
  dynamic imageAkta;
  @JsonKey(name: "status")
  String? status;

  BusinessPartner({
    this.companyName,
    this.noNpwp,
    this.noNib,
    this.imageNpwp,
    this.imageNib,
    this.imageAkta,
    this.status,
  });

  factory BusinessPartner.fromJson(Map<String, dynamic> json) =>
      _$BusinessPartnerFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessPartnerToJson(this);
}
