import 'dart:convert';
import 'package:get_storage/get_storage.dart';

import 'constants.dart';

abstract class Sessions {
  static final box = GetStorage();

  static Future clear() async => await GetStorage().erase();

  static Future setToken(String token) async =>
      box.write(SessionKeys.token, token);
  static Future setDevicePair(String device) async =>
      box.write(SessionKeys.device, device);
  static Future setDriver(String driver) async =>
      box.write(SessionKeys.driver, driver);
  static Future isLogin(String isLogin) async =>
      box.write(SessionKeys.isLogin, isLogin);
  static Future setTheme(Map<String, dynamic> theme) async =>
      box.write(SessionKeys.theme, theme);
  static String? getToken() => box.read<String>(SessionKeys.token);
  static String? getIsLogin() => box.read<String>(SessionKeys.isLogin);
  static String? getDevicePair() => box.read<String>(SessionKeys.device);
  static String? getDriver() => box.read<String>(SessionKeys.driver);

  static Map<String, dynamic>? getTheme() =>
      box.read<Map<String, dynamic>>(SessionKeys.theme);
}
