// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      id: json['id'] as int?,
      noSuratJalan: json['no_surat_jalan'] as String?,
      transactionPurpose: json['transaction_purpose'] as String?,
      quantity: json['quantity'] as int?,
      notes: json['notes'] as String?,
      signatureImage: json['signature_image'] as String?,
      instalationImage: (json['instalation_image'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      statusTransaction: json['status_transaction'] as String?,
      teknisi: (json['teknisi'] as List<dynamic>?)
          ?.map((e) => Teknisi.fromJson(e as Map<String, dynamic>))
          .toList(),
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
      idUser: json['id_user'] as int?,
      createdBy: json['created_by'] as String?,
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'no_surat_jalan': instance.noSuratJalan,
      'transaction_purpose': instance.transactionPurpose,
      'quantity': instance.quantity,
      'notes': instance.notes,
      'signature_image': instance.signatureImage,
      'instalation_image': instance.instalationImage,
      'status_transaction': instance.statusTransaction,
      'teknisi': instance.teknisi,
      'created': instance.created?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
      'id_user': instance.idUser,
      'created_by': instance.createdBy,
    };

Teknisi _$TeknisiFromJson(Map<String, dynamic> json) => Teknisi(
      username: json['username'] as String?,
    );

Map<String, dynamic> _$TeknisiToJson(Teknisi instance) => <String, dynamic>{
      'username': instance.username,
    };
