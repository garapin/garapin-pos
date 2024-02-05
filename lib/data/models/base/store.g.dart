// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Store _$StoreFromJson(Map<String, dynamic> json) => Store(
      id: json['_id'] as String?,
      storeName: json['store_name'] as String?,
      picName: json['pic_name'],
      address: json['address'],
      city: json['city'],
      country: json['country'],
      postalCode: json['postal_code'],
      storeImage: json['store_image'],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      '_id': instance.id,
      'store_name': instance.storeName,
      'pic_name': instance.picName,
      'address': instance.address,
      'city': instance.city,
      'country': instance.country,
      'postal_code': instance.postalCode,
      'store_image': instance.storeImage,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };
