import 'package:json_annotation/json_annotation.dart';

part 'instalation_vehicle.g.dart';

@JsonSerializable()
class InstalationVehicle {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "vehicle_name")
  String? vehicleName;
  @JsonKey(name: "vehicle_no")
  String? vehicleNo;
  @JsonKey(name: "odo_meter")
  String? odoMeter;
  @JsonKey(name: "memory")
  String? memory;
  @JsonKey(name: "instalation_images")
  List<String>? instalationImages;
  @JsonKey(name: "no_product")
  String? noProduct;
  @JsonKey(name: "imei")
  String? imei;
  @JsonKey(name: "no_sn")
  String? noSn;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "mitra_name")
  String? mitraName;
  @JsonKey(name: "mitra_full_name")
  String? mitraFullName;
  @JsonKey(name: "mitra_address")
  String? mitraAddress;
  @JsonKey(name: "created")
  DateTime? created;
  @JsonKey(name: "updated")
  DateTime? updated;

  InstalationVehicle({
    this.id,
    this.vehicleName,
    this.vehicleNo,
    this.odoMeter,
    this.memory,
    this.instalationImages,
    this.noProduct,
    this.imei,
    this.noSn,
    this.status,
    this.name,
    this.image,
    this.mitraName,
    this.mitraFullName,
    this.mitraAddress,
    this.created,
    this.updated,
  });

  factory InstalationVehicle.fromJson(Map<String, dynamic> json) =>
      _$InstalationVehicleFromJson(json);

  Map<String, dynamic> toJson() => _$InstalationVehicleToJson(this);
}
