import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "no_handphone")
  String? noHandphone;
  @JsonKey(name: "password")
  String? password;
  @JsonKey(name: "username")
  String? username;
  @JsonKey(name: "role")
  String? role;
  @JsonKey(name: "created")
  DateTime? created;
  @JsonKey(name: "updated")
  DateTime? updated;

  User({
    this.id,
    this.email,
    this.noHandphone,
    this.password,
    this.username,
    this.role,
    this.created,
    this.updated,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
