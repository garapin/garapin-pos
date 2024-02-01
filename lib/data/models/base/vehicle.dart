import 'package:json_annotation/json_annotation.dart';

part 'vehicle.g.dart';

@JsonSerializable()
class Vehicle {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "id_transaction_item")
  int? idTransactionItem;
  @JsonKey(name: "id_mitra")
  String? idMitra;
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

  Vehicle({
    this.id,
    this.idTransactionItem,
    this.idMitra,
    this.vehicleName,
    this.vehicleNo,
    this.odoMeter,
    this.memory,
    this.instalationImages,
    this.mitraName,
    this.mitraFullName,
    this.mitraAddress,
    this.created,
    this.updated,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleToJson(this);
}
