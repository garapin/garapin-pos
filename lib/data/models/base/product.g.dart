// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      quantity: json['quantity'] as int?,
      description: json['description'] as String?,
      codeProduct: json['code_product'] as String?,
      status: json['status'] as String?,
      scanImei: json['scan_imei'] as String?,
      scanSn: json['scan_sn'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'quantity': instance.quantity,
      'description': instance.description,
      'code_product': instance.codeProduct,
      'status': instance.status,
      'scan_imei': instance.scanImei,
      'scan_sn': instance.scanSn,
      'created': instance.created?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
    };
