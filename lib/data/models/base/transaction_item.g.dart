// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionItem _$TransactionItemFromJson(Map<String, dynamic> json) =>
    TransactionItem(
      id: json['id'] as String?,
      idTransaction: json['id_transaction'] as String?,
      idProductItem: json['id_product_item'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
      idUser: json['id_user'] as String?,
    );

Map<String, dynamic> _$TransactionItemToJson(TransactionItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_transaction': instance.idTransaction,
      'id_product_item': instance.idProductItem,
      'created': instance.created?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
      'id_user': instance.idUser,
    };
