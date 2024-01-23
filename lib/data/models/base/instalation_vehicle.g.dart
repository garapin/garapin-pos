// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instalation_vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstalationVehicle _$InstalationVehicleFromJson(Map<String, dynamic> json) =>
    InstalationVehicle(
      id: json['id'] as int?,
      mitra: json['mitra'] as String?,
      vehicleName: json['vehicle_name'] as String?,
      vehicleNo: json['vehicle_no'] as String?,
      odoMeter: json['odo_meter'] as String?,
      memory: json['memory'] as String?,
      instalationImages: (json['instalation_images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      noProduct: json['no_product'] as String?,
      imei: json['imei'] as String?,
      noSn: json['no_sn'] as String?,
      status: json['status'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
    );

Map<String, dynamic> _$InstalationVehicleToJson(InstalationVehicle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mitra': instance.mitra,
      'vehicle_name': instance.vehicleName,
      'vehicle_no': instance.vehicleNo,
      'odo_meter': instance.odoMeter,
      'memory': instance.memory,
      'instalation_images': instance.instalationImages,
      'no_product': instance.noProduct,
      'imei': instance.imei,
      'no_sn': instance.noSn,
      'status': instance.status,
      'name': instance.name,
      'image': instance.image,
      'created': instance.created?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
    };
