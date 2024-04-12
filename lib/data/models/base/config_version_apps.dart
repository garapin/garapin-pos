// To parse this JSON data, do
//
//     final configVersionApps = configVersionAppsFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'config_version_apps.g.dart';

//test login test

@JsonSerializable()
class ConfigVersionApps {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "current_version")
  String? currentVersion;
  @JsonKey(name: "link_playstore")
  String? linkPlaystore;
  @JsonKey(name: "link_appstore")
  String? linkAppstore;
  @JsonKey(name: "test_login")
  String? testLogin;

  ConfigVersionApps({
    this.id,
    this.currentVersion,
    this.linkPlaystore,
    this.linkAppstore,
    this.testLogin,
  });

  factory ConfigVersionApps.fromJson(Map<String, dynamic> json) =>
      _$ConfigVersionAppsFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigVersionAppsToJson(this);
}
