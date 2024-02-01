import 'package:json_annotation/json_annotation.dart';

part 'mitra.g.dart';

@JsonSerializable()
class Mitra {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "full_name")
  String? fullName;
  @JsonKey(name: "address")
  String? address;
  @JsonKey(name: "created")
  DateTime? created;
  @JsonKey(name: "updated")
  DateTime? updated;

  Mitra({
    this.id,
    this.name,
    this.fullName,
    this.address,
    this.created,
    this.updated,
  });

  factory Mitra.fromJson(Map<String, dynamic> json) => _$MitraFromJson(json);

  Map<String, dynamic> toJson() => _$MitraToJson(this);
}
