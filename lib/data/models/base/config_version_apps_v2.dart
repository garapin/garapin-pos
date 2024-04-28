import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'config_version_apps_v2.g.dart';

@JsonSerializable()
class ConfigVersionAppsV2 {
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

  ConfigVersionAppsV2({
    this.id,
    this.currentVersion,
    this.linkPlaystore,
    this.linkAppstore,
    this.testLogin,
  });

  factory ConfigVersionAppsV2.fromJson(Map<String, dynamic> json) =>
      _$ConfigVersionAppsV2FromJson(json);

  Map<String, dynamic> toJson() => _$ConfigVersionAppsV2ToJson(this);
}
