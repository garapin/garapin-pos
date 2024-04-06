// To parse this JSON data, do
//
//     final userDatabase = userDatabaseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'database_store.dart';

part 'user_database.g.dart';

@JsonSerializable()
class UserDatabase {
  @JsonKey(name: "user")
  User? user;
  @JsonKey(name: "database")
  List<DatabaseStore>? database;

  UserDatabase({
    this.user,
    this.database,
  });

  factory UserDatabase.fromJson(Map<String, dynamic> json) =>
      _$UserDatabaseFromJson(json);

  Map<String, dynamic> toJson() => _$UserDatabaseToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "username")
  dynamic username;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "store_database_name")
  List<dynamic>? storeDatabaseName;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "__v")
  int? v;
  @JsonKey(name: "token")
  String? token;

  User({
    this.id,
    this.username,
    this.email,
    this.storeDatabaseName,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
