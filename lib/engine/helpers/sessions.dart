import 'dart:convert';
import 'package:abditrack_inventory/data/models/base/user.dart';
import 'package:get_storage/get_storage.dart';

import 'constants.dart';

abstract class Sessions {
  static final box = GetStorage();

  static Future clear() async => await GetStorage().erase();

  ///SET
  static Future setToken(String token) async =>
      box.write(SessionKeys.token, token);
  static Future setUsers(String user) async =>
      box.write(SessionKeys.user, user);
  static Future setTheme(Map<String, dynamic> theme) async =>
      box.write(SessionKeys.theme, theme);

  ///GET
  static String? getUser() => box.read<String>(SessionKeys.user);
  static String? getToken() => box.read<String>(SessionKeys.token);
  static Map<String, dynamic>? getTheme() =>
      box.read<Map<String, dynamic>>(SessionKeys.theme);

  static User? getUserModel() {
    String? data = getUser();
    if (data != null) {
      User user = User.fromJson(jsonDecode(data));
      return user;
    } else {
      return null;
    }
  }
}
