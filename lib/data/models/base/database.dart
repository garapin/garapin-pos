import 'package:json_annotation/json_annotation.dart';

part 'database.g.dart';

@JsonSerializable()
class Database {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "connection_string")
  String? connectionString;
  @JsonKey(name: "role")
  String? role;
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;

  Database({
    this.name,
    this.connectionString,
    this.role,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory Database.fromJson(Map<String, dynamic> json) =>
      _$DatabaseFromJson(json);

  Map<String, dynamic> toJson() => _$DatabaseToJson(this);
}
