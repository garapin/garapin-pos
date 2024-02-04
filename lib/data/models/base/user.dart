import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "username")
  dynamic username;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "store_database_name")
  List<StoreDatabaseName>? storeDatabaseName;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "__v")
  int? v;

  User({
    this.id,
    this.username,
    this.email,
    this.storeDatabaseName,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class StoreDatabaseName {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "conncetion_string")
  String? conncetionString;
  @JsonKey(name: "role")
  String? role;

  StoreDatabaseName({
    this.name,
    this.conncetionString,
    this.role,
  });

  factory StoreDatabaseName.fromJson(Map<String, dynamic> json) =>
      _$StoreDatabaseNameFromJson(json);

  Map<String, dynamic> toJson() => _$StoreDatabaseNameToJson(this);
}
