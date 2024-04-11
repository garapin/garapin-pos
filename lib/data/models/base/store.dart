// To parse this JSON data, do
//
//     final store = storeFromJson(jsonString);
import 'package:json_annotation/json_annotation.dart';
import 'package:pos/data/models/base/bank_account.dart';

import 'bussiness_partner.dart';

part 'store.g.dart';

@JsonSerializable()
class Store {
  @JsonKey(name: "store")
  StoreClass? store;
  @JsonKey(name: "users")
  List<UserStore>? users;

  Store({
    this.store,
    this.users,
  });

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  Map<String, dynamic> toJson() => _$StoreToJson(this);
}

@JsonSerializable()
class StoreClass {
  @JsonKey(name: "bank_account")
  BankAccount? bankAccount;
  @JsonKey(name: "business_partner")
  BusinessPartner? businessPartner;
  @JsonKey(name: "account_holder")
  AccountHolder? accountHolder;
  @JsonKey(name: "_id")
  String? id;
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
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "__v")
  int? v;
  @JsonKey(name: "phone_number")
  String? phoneNumber;
  @JsonKey(name: "store_name")
  String? storeName;
  @JsonKey(name: "store_type")
  String? storeType;
  @JsonKey(name: "merchant_role")
  String? merChantRole;
  @JsonKey(name: "store_status")
  String? storeStatus;
  @JsonKey(name: "id_parent")
  String? dbParent;

  StoreClass({
    this.businessPartner,
    this.accountHolder,
    this.id,
    this.picName,
    this.address,
    this.state,
    this.city,
    this.country,
    this.postalCode,
    this.storeImage,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.phoneNumber,
    this.storeName,
    this.storeType,
    this.merChantRole,
    this.storeStatus,
    this.dbParent,
  });

  factory StoreClass.fromJson(Map<String, dynamic> json) =>
      _$StoreClassFromJson(json);

  Map<String, dynamic> toJson() => _$StoreClassToJson(this);
}

@JsonSerializable()
class AccountHolder {
  @JsonKey(name: "public_profile")
  PublicProfile? publicProfile;
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "created")
  DateTime? created;
  @JsonKey(name: "updated")
  DateTime? updated;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "country")
  String? country;
  @JsonKey(name: "status")
  String? status;

  AccountHolder({
    this.publicProfile,
    this.id,
    this.created,
    this.updated,
    this.email,
    this.type,
    this.country,
    this.status,
  });

  factory AccountHolder.fromJson(Map<String, dynamic> json) =>
      _$AccountHolderFromJson(json);

  Map<String, dynamic> toJson() => _$AccountHolderToJson(this);
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
class UserStore {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "username")
  dynamic username;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "store_database_name")
  StoreDatabaseName? storeDatabaseName;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "__v")
  int? v;

  UserStore({
    this.id,
    this.username,
    this.email,
    this.storeDatabaseName,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory UserStore.fromJson(Map<String, dynamic> json) =>
      _$UserStoreFromJson(json);

  Map<String, dynamic> toJson() => _$UserStoreToJson(this);
}

@JsonSerializable()
class StoreDatabaseName {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "connection_string")
  String? connectionString;
  @JsonKey(name: "role")
  String? role;
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;

  StoreDatabaseName({
    this.name,
    this.connectionString,
    this.role,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory StoreDatabaseName.fromJson(Map<String, dynamic> json) =>
      _$StoreDatabaseNameFromJson(json);

  Map<String, dynamic> toJson() => _$StoreDatabaseNameToJson(this);
}
