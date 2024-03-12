import 'dart:convert';
import 'package:pos/data/models/base/database.dart';
import 'package:pos/data/models/base/store.dart';
import 'package:pos/data/models/base/user.dart';
import 'package:get_storage/get_storage.dart';

import 'constants.dart';

abstract class Sessions {
  static final box = GetStorage();

  static Future clear() async => await GetStorage().erase();

  ///SET
  static Future setToken(String token) async =>
      box.write(SessionKeys.token, token);
  static Future setIsLogin(String isLogin) async =>
      box.write(SessionKeys.isLogin, isLogin);
  static Future setUsers(String user) async =>
      box.write(SessionKeys.user, user);
  static Future setDatabase(String database) async =>
      box.write(SessionKeys.database, database);
  static Future setAccountHolder(String accountHolder) async =>
      box.write(SessionKeys.accountHolder, accountHolder);
  static Future setDeviceBluethooth(String deviceBluethooth) async =>
      box.write(SessionKeys.bluetooth, deviceBluethooth);

  ///GET
  static String? getUser() => box.read<String>(SessionKeys.user);
  static String? getIsLogin() => box.read<String>(SessionKeys.isLogin);
  static String? getToken() => box.read<String>(SessionKeys.token);
  static String? getDatabase() => box.read<String>(SessionKeys.database);
  static String? getAccountHolder() =>
      box.read<String>(SessionKeys.accountHolder);
  static String? getDeviceBluethooth() =>
      box.read<String>(SessionKeys.bluetooth);

  static User? getUserModel() {
    String? data = getUser();
    if (data != null) {
      User user = User.fromJson(jsonDecode(data));
      return user;
    } else {
      return null;
    }
  }

  static Database? getDatabaseModel() {
    String? data = getDatabase();
    if (data != null) {
      Database db = Database.fromJson(jsonDecode(data));
      return db;
    } else {
      return null;
    }
  }

  static AccountHolder? getAccountHolderModel() {
    String? data = getAccountHolder();
    if (data != null) {
      AccountHolder db = AccountHolder.fromJson(jsonDecode(data));
      return db;
    } else {
      return null;
    }
  }
}
