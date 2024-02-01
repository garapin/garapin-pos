// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mitra.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mitra _$MitraFromJson(Map<String, dynamic> json) => Mitra(
      id: json['id'] as int?,
      name: json['name'] as String?,
      fullName: json['full_name'] as String?,
      address: json['address'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
    );

Map<String, dynamic> _$MitraToJson(Mitra instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'full_name': instance.fullName,
      'address': instance.address,
      'created': instance.created?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
    };
