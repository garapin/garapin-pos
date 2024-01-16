// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionDetail _$TransactionDetailFromJson(Map<String, dynamic> json) =>
    TransactionDetail(
      id: json['id'] as int?,
      noSuratJalan: json['no_surat_jalan'] as String?,
      transactionPurpose: json['transaction_purpose'] as String?,
      notes: json['notes'] as String?,
      signatureImage: json['signature_image'] as String?,
      statusTransaction: json['status_transaction'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
      idUser: json['id_user'] as int?,
      createdBy: json['created_by'] as String?,
    );

Map<String, dynamic> _$TransactionDetailToJson(TransactionDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'no_surat_jalan': instance.noSuratJalan,
      'transaction_purpose': instance.transactionPurpose,
      'notes': instance.notes,
      'signature_image': instance.signatureImage,
      'status_transaction': instance.statusTransaction,
      'created': instance.created?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
      'id_user': instance.idUser,
      'created_by': instance.createdBy,
    };
