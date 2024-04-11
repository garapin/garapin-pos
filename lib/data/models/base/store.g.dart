// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Store _$StoreFromJson(Map<String, dynamic> json) => Store(
      store: json['store'] == null
          ? null
          : StoreClass.fromJson(json['store'] as Map<String, dynamic>),
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => UserStore.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      'store': instance.store,
      'users': instance.users,
    };

StoreClass _$StoreClassFromJson(Map<String, dynamic> json) => StoreClass(
      businessPartner: json['business_partner'] == null
          ? null
          : BusinessPartner.fromJson(
              json['business_partner'] as Map<String, dynamic>),
      accountHolder: json['account_holder'] == null
          ? null
          : AccountHolder.fromJson(
              json['account_holder'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      picName: json['pic_name'] as String?,
      address: json['address'] as String?,
      state: json['state'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      postalCode: json['postal_code'] as String?,
      storeImage: json['store_image'],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
      phoneNumber: json['phone_number'] as String?,
      storeName: json['store_name'] as String?,
      storeType: json['store_type'] as String?,
      merChantRole: json['merchant_role'] as String?,
      storeStatus: json['store_status'] as String?,
      dbParent: json['id_parent'] as String?,
    )..bankAccount = json['bank_account'] == null
        ? null
        : BankAccount.fromJson(json['bank_account'] as Map<String, dynamic>);

Map<String, dynamic> _$StoreClassToJson(StoreClass instance) =>
    <String, dynamic>{
      'bank_account': instance.bankAccount,
      'business_partner': instance.businessPartner,
      'account_holder': instance.accountHolder,
      '_id': instance.id,
      'pic_name': instance.picName,
      'address': instance.address,
      'state': instance.state,
      'city': instance.city,
      'country': instance.country,
      'postal_code': instance.postalCode,
      'store_image': instance.storeImage,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
      'phone_number': instance.phoneNumber,
      'store_name': instance.storeName,
      'store_type': instance.storeType,
      'merchant_role': instance.merChantRole,
      'store_status': instance.storeStatus,
      'id_parent': instance.dbParent,
    };

AccountHolder _$AccountHolderFromJson(Map<String, dynamic> json) =>
    AccountHolder(
      publicProfile: json['public_profile'] == null
          ? null
          : PublicProfile.fromJson(
              json['public_profile'] as Map<String, dynamic>),
      id: json['id'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
      email: json['email'] as String?,
      type: json['type'] as String?,
      country: json['country'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$AccountHolderToJson(AccountHolder instance) =>
    <String, dynamic>{
      'public_profile': instance.publicProfile,
      'id': instance.id,
      'created': instance.created?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
      'email': instance.email,
      'type': instance.type,
      'country': instance.country,
      'status': instance.status,
    };

PublicProfile _$PublicProfileFromJson(Map<String, dynamic> json) =>
    PublicProfile(
      businessName: json['business_name'] as String?,
    );

Map<String, dynamic> _$PublicProfileToJson(PublicProfile instance) =>
    <String, dynamic>{
      'business_name': instance.businessName,
    };

UserStore _$UserStoreFromJson(Map<String, dynamic> json) => UserStore(
      id: json['_id'] as String?,
      username: json['username'],
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

Map<String, dynamic> _$UserStoreToJson(UserStore instance) => <String, dynamic>{
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
