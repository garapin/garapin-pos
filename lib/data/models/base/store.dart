import 'package:json_annotation/json_annotation.dart';

part 'store.g.dart';

@JsonSerializable()
class Store {
  @JsonKey(name: "store")
  StoreClass? store;
  @JsonKey(name: "users")
  List<UsersStore>? usersStore;

  Store({
    this.store,
    this.usersStore,
  });

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  Map<String, dynamic> toJson() => _$StoreToJson(this);
}

@JsonSerializable()
class StoreClass {
  @JsonKey(name: "state")
  String? state;
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "store_name")
  String? storeName;
  @JsonKey(name: "pic_name")
  String? picName;
  @JsonKey(name: "address")
  String? address;
  @JsonKey(name: "city")
  String? city;
  @JsonKey(name: "country")
  String? country;
  @JsonKey(name: "postal_code")
  String? postalCode;
  @JsonKey(name: "store_image")
  String? storeImage;
  @JsonKey(name: "phone_number")
  String? noTelepon;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "__v")
  int? v;

  StoreClass({
    this.state,
    this.id,
    this.storeName,
    this.picName,
    this.address,
    this.city,
    this.country,
    this.postalCode,
    this.storeImage,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory StoreClass.fromJson(Map<String, dynamic> json) =>
      _$StoreClassFromJson(json);

  Map<String, dynamic> toJson() => _$StoreClassToJson(this);
}

@JsonSerializable()
class UsersStore {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "username")
  String? username;
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

  UsersStore({
    this.id,
    this.username,
    this.email,
    this.storeDatabaseName,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory UsersStore.fromJson(Map<String, dynamic> json) =>
      _$UsersStoreFromJson(json);

  Map<String, dynamic> toJson() => _$UsersStoreToJson(this);
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
