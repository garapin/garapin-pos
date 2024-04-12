// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_version_apps.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigVersionApps _$ConfigVersionAppsFromJson(Map<String, dynamic> json) =>
    ConfigVersionApps(
      id: json['_id'] as String?,
      currentVersion: json['current_version'] as String?,
      linkPlaystore: json['link_playstore'] as String?,
      linkAppstore: json['link_appstore'] as String?,
      testLogin: json['test_login'] as String?,
    );

Map<String, dynamic> _$ConfigVersionAppsToJson(ConfigVersionApps instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'current_version': instance.currentVersion,
      'link_playstore': instance.linkPlaystore,
      'link_appstore': instance.linkAppstore,
      'test_login': instance.testLogin,
    };
