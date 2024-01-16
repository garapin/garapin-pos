// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProduct _$AddProductFromJson(Map<String, dynamic> json) => AddProduct(
      name: json['name'] as String?,
      imei: json['imei'] as String?,
      noSn: json['no_sn'] as String?,
      noProduct: json['no_product'] as String?,
      status: json['status'] as String?,
      createdBy: json['created_by'] as int?,
    );

Map<String, dynamic> _$AddProductToJson(AddProduct instance) =>
    <String, dynamic>{
      'name': instance.name,
      'imei': instance.imei,
      'no_sn': instance.noSn,
      'no_product': instance.noProduct,
      'status': instance.status,
      'created_by': instance.createdBy,
    };
