// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DatabaseStore _$DatabaseStoreFromJson(Map<String, dynamic> json) =>
    DatabaseStore(
      dbName: json['dbName'] as String?,
      storesData: json['storesData'] == null
          ? null
          : StoresData.fromJson(json['storesData'] as Map<String, dynamic>),
    )
      ..user = json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>)
      ..emailOwner = json['email_owner'] as String?;

Map<String, dynamic> _$DatabaseStoreToJson(DatabaseStore instance) =>
    <String, dynamic>{
      'user': instance.user,
      'dbName': instance.dbName,
      'email_owner': instance.emailOwner,
      'storesData': instance.storesData,
    };

StoresData _$StoresDataFromJson(Map<String, dynamic> json) => StoresData(
      id: json['_id'] as String?,
      storeType: json['store_type'] as String?,
      merchantRole: json['merchant_role'] as String?,
      idParent: json['id_parent'] as String?,
      storeName: json['store_name'] as String?,
      storeStatus: json['store_status'] as String?,
      picName: json['pic_name'] as String?,
      address: json['address'] as String?,
      state: json['state'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      postalCode: json['postal_code'] as String?,
      storeImage: json['store_image'],
      businessPartner: json['business_partner'] == null
          ? null
          : BusinessPartner.fromJson(
              json['business_partner'] as Map<String, dynamic>),
      bankAccount: json['bank_account'] == null
          ? null
          : BankAccount.fromJson(json['bank_account'] as Map<String, dynamic>),
      accountHolder: json['account_holder'] == null
          ? null
          : AccountHolder.fromJson(
              json['account_holder'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
      phoneNumber: json['phone_number'] as String?,
    );

Map<String, dynamic> _$StoresDataToJson(StoresData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'store_type': instance.storeType,
      'merchant_role': instance.merchantRole,
      'id_parent': instance.idParent,
      'store_name': instance.storeName,
      'store_status': instance.storeStatus,
      'pic_name': instance.picName,
      'address': instance.address,
      'state': instance.state,
      'city': instance.city,
      'country': instance.country,
      'postal_code': instance.postalCode,
      'store_image': instance.storeImage,
      'business_partner': instance.businessPartner,
      'bank_account': instance.bankAccount,
      'account_holder': instance.accountHolder,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
      'phone_number': instance.phoneNumber,
    };

PublicProfile _$PublicProfileFromJson(Map<String, dynamic> json) =>
    PublicProfile(
      businessName: json['business_name'] as String?,
    );

Map<String, dynamic> _$PublicProfileToJson(PublicProfile instance) =>
    <String, dynamic>{
      'business_name': instance.businessName,
    };

BankAccount _$BankAccountFromJson(Map<String, dynamic> json) => BankAccount(
      bankName: json['bank_name'],
      holderName: json['holder_name'],
      accountNumber: json['account_number'],
      pin: json['pin'],
    );

Map<String, dynamic> _$BankAccountToJson(BankAccount instance) =>
    <String, dynamic>{
      'bank_name': instance.bankName,
      'holder_name': instance.holderName,
      'account_number': instance.accountNumber,
      'pin': instance.pin,
    };

BusinessPartner _$BusinessPartnerFromJson(Map<String, dynamic> json) =>
    BusinessPartner(
      companyName: json['company_name'],
      noNpwp: json['no_npwp'],
      noNib: json['no_nib'],
      imageNpwp: json['image_npwp'],
      imageNib: json['image_nib'],
      imageAkta: json['image_akta'],
      status: json['status'] as String?,
    );

Map<String, dynamic> _$BusinessPartnerToJson(BusinessPartner instance) =>
    <String, dynamic>{
      'company_name': instance.companyName,
      'no_npwp': instance.noNpwp,
      'no_nib': instance.noNib,
      'image_npwp': instance.imageNpwp,
      'image_nib': instance.imageNib,
      'image_akta': instance.imageAkta,
      'status': instance.status,
    };
