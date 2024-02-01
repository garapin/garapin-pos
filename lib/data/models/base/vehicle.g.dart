// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vehicle _$VehicleFromJson(Map<String, dynamic> json) => Vehicle(
      id: json['id'] as int?,
      idTransactionItem: json['id_transaction_item'] as int?,
      idMitra: json['id_mitra'] as String?,
      vehicleName: json['vehicle_name'] as String?,
      vehicleNo: json['vehicle_no'] as String?,
      odoMeter: json['odo_meter'] as String?,
      memory: json['memory'] as String?,
      instalationImages: (json['instalation_images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      mitraName: json['mitra_name'] as String?,
      mitraFullName: json['mitra_full_name'] as String?,
      mitraAddress: json['mitra_address'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
    );

Map<String, dynamic> _$VehicleToJson(Vehicle instance) => <String, dynamic>{
      'id': instance.id,
      'id_transaction_item': instance.idTransactionItem,
      'id_mitra': instance.idMitra,
      'vehicle_name': instance.vehicleName,
      'vehicle_no': instance.vehicleNo,
      'odo_meter': instance.odoMeter,
      'memory': instance.memory,
      'instalation_images': instance.instalationImages,
      'mitra_name': instance.mitraName,
      'mitra_full_name': instance.mitraFullName,
      'mitra_address': instance.mitraAddress,
      'created': instance.created?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
    };
