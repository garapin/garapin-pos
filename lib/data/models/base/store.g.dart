// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Store _$StoreFromJson(Map<String, dynamic> json) => Store(
      store: json['store'] == null
          ? null
          : StoreClass.fromJson(json['store'] as Map<String, dynamic>),
      usersStore: (json['users'] as List<dynamic>?)
          ?.map((e) => UsersStore.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      'store': instance.store,
      'users': instance.usersStore,
    };

StoreClass _$StoreClassFromJson(Map<String, dynamic> json) => StoreClass(
      state: json['state'] as String?,
      id: json['_id'] as String?,
      storeName: json['store_name'] as String?,
      picName: json['pic_name'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      postalCode: json['postal_code'] as String?,
      storeImage: json['store_image'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    )..noTelepon = json['phone_number'] as String?;

Map<String, dynamic> _$StoreClassToJson(StoreClass instance) =>
    <String, dynamic>{
      'state': instance.state,
      '_id': instance.id,
      'store_name': instance.storeName,
      'pic_name': instance.picName,
      'address': instance.address,
      'city': instance.city,
      'country': instance.country,
      'postal_code': instance.postalCode,
      'store_image': instance.storeImage,
      'phone_number': instance.noTelepon,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };

UsersStore _$UsersStoreFromJson(Map<String, dynamic> json) => UsersStore(
      id: json['_id'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      storeDatabaseName: json['store_database_name'] == null
          ? null
          : StoreDatabaseName.fromJson(
              json['store_database_name'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$UsersStoreToJson(UsersStore instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'store_database_name': instance.storeDatabaseName,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };

StoreDatabaseName _$StoreDatabaseNameFromJson(Map<String, dynamic> json) =>
    StoreDatabaseName(
      name: json['name'] as String?,
      connectionString: json['connection_string'] as String?,
      role: json['role'] as String?,
      id: json['_id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$StoreDatabaseNameToJson(StoreDatabaseName instance) =>
    <String, dynamic>{
      'name': instance.name,
      'connection_string': instance.connectionString,
      'role': instance.role,
      '_id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
