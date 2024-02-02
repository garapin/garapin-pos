import 'package:flutter/material.dart';
import '../../resources/assets.gen.dart';
import '../../resources/resources.dart';

part 'client.dart';

enum EnvironmentMode { test, dev, production }

abstract class Environment {
  static EnvironmentMode mode = EnvironmentMode.dev;
  static String uri = 'Mobile Apps';

  static bool isDev = mode == EnvironmentMode.dev;

  static String baseAPIUrl() => baseUrl();

  static String showUrlImage({required String path}) => urlImage(path: path);

  static AssetGenImage appIcon() {
    return Resources.images.armor;
  }

  static String baseUrl({String? url}) {
    return Development.baseUrl();
  }

  static String urlImage({required String path}) {
    return Development.urlImage() + path;
  }

  static String googleMapKey() {
    return Development.googleMapKey;
  }

  static String appName() {
    return Development.appName;
  }

  static String appVersion = '';
  static String appBuildNumber = '';

  static Locale currentLanguages = const Locale('id');
}

extension EnvironmentModeExtension on EnvironmentMode {
  String val() {
    switch (this) {
      case EnvironmentMode.production:
        return 'Production';
      case EnvironmentMode.dev:
        return 'Development';
      case EnvironmentMode.test:
        return 'Test';
    }
  }
}
