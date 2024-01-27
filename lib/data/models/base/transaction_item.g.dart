// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionItem _$TransactionItemFromJson(Map<String, dynamic> json) =>
    TransactionItem(
      id: json['id'] as int?,
      idProductItem: json['id_product_item'] as int?,
      idProduct: json['id_product'] as int?,
      name: json['name'] as String?,
      imei: json['imei'] as String?,
      noSn: json['no_sn'] as String?,
      noProduct: json['no_product'] as String?,
      status: json['status'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
      idUser: json['id_user'] as int?,
    );

Map<String, dynamic> _$TransactionItemToJson(TransactionItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_product_item': instance.idProductItem,
      'id_product': instance.idProduct,
      'name': instance.name,
      'imei': instance.imei,
      'no_sn': instance.noSn,
      'no_product': instance.noProduct,
      'status': instance.status,
      'created': instance.created?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
      'id_user': instance.idUser,
    };
