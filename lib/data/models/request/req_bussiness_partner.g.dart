// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'req_bussiness_partner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReqBussinesspartner _$ReqBussinesspartnerFromJson(Map<String, dynamic> json) =>
    ReqBussinesspartner(
      companyName: json['company_name'] as String?,
      noNpwp: json['no_npwp'] as String?,
      noNib: json['no_nib'] as String?,
      imageNpwp: json['image_npwp'] as String?,
      imageNib: json['image_nib'] as String?,
      imageAkta: json['image_akta'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$ReqBussinesspartnerToJson(
        ReqBussinesspartner instance) =>
    <String, dynamic>{
      'company_name': instance.companyName,
      'no_npwp': instance.noNpwp,
      'no_nib': instance.noNib,
      'image_npwp': instance.imageNpwp,
      'image_nib': instance.imageNib,
      'image_akta': instance.imageAkta,
      'status': instance.status,
    };
