// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailablePayment _$AvailablePaymentFromJson(Map<String, dynamic> json) =>
    AvailablePayment(
      id: json['_id'] as String?,
      bank: json['bank'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$AvailablePaymentToJson(AvailablePayment instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'bank': instance.bank,
      'image': instance.image,
    };
