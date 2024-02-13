import 'package:json_annotation/json_annotation.dart';

part 'brand.g.dart';

@JsonSerializable()
class Brand {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "brand")
  String? brand;
  @JsonKey(name: "production")
  String? production;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "__v")
  int? v;

  Brand({
    this.id,
    this.brand,
    this.production,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);

  Map<String, dynamic> toJson() => _$BrandToJson(this);
}
