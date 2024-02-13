import 'package:json_annotation/json_annotation.dart';

part 'unit.g.dart';

@JsonSerializable()
class Unit {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "unit")
  String? unit;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "__v")
  int? v;

  Unit({
    this.id,
    this.unit,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);

  Map<String, dynamic> toJson() => _$UnitToJson(this);
}
