import 'dart:developer';
import 'dart:io';
import 'package:pos/data/api/error_handler.dart';
import 'package:pos/data/models/base/store.dart';
import 'package:pos/engine/engine.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/base/user.dart';
import 'configure.dart';
import 'response.dart';

class ApiService {
  static Future<ApiResponse<String>> getToken(BuildContext context) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String deviceId;
    String brand;

    if (kIsWeb) {
      WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
      deviceId = webBrowserInfo.userAgent ??
          webBrowserInfo.appVersion ??
          webBrowserInfo.appCodeName ??
          'Website';
      brand = webBrowserInfo.browserName.name;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor ?? '${iosInfo.systemName}';
      brand = 'iOS - ${iosInfo.model}';

      log('${iosInfo.name}');
      log('${iosInfo.systemName}');
      log('${iosInfo.systemVersion}');
      log('${iosInfo.model}');
      log('${iosInfo.localizedModel}');
      log('${iosInfo.identifierForVendor}');
      log('${iosInfo.isPhysicalDevice}');
      log('${iosInfo.utsname.sysname}');
      log('${iosInfo.utsname.nodename}');
      log('${iosInfo.utsname.release}');
      log('${iosInfo.utsname.version}');
      log('${iosInfo.utsname.machine}');
    } else {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.id;
      brand = '${androidInfo.brand} - ${androidInfo.model}';
    }

    return await ApiConfigure(context)
        .post(
          'Connect/token',
          params: {"device_id": deviceId, "brand": brand},
        )
        .then((result) => ApiResponse<String>.fromJson(result.data))
        .handler((error) => ApiResponse<String>.onError(error));
  }

  // static Future<ApiResponse> createUser(BuildContext context,
  //     {required Map<String, dynamic> params}) async {
  //   return await ApiConfigure(context)
  //       .post('user/create', params: params)
  //       .then((result) => ApiResponse.fromJson(result.data))
  //       .handler((error) => ApiResponse.onError(error));
  // }

  // static Future<ApiResponse<User>> getUserId(
  //   BuildContext context,
  // ) async {
  //   return await ApiConfigure(context)
  //       .get('user/${Sessions.getUserModel()?.id}')
  //       .then((result) => ApiResponse<User>.fromJson(result.data))
  //       .handler((error) => ApiResponse<User>.onError(error));
  // }

  static Future<ApiResponse<User>> signinWithGoogle(BuildContext context,
      {required String email}) async {
    return await ApiConfigure(context)
        .post('auth/signin_with_google', params: {"email": email})
        .then((result) => ApiResponse<User>.fromJson(result.data))
        .handler((error) => ApiResponse<User>.onError(error));
  }

  static Future<ApiResponse<User>> createDatabase(BuildContext context,
      {required String databaseName}) async {
    return await ApiConfigure(context)
        .post('store/register', params: {
          "store_name": databaseName,
          "email": Sessions.getUserModel()?.email,
          "connection_string": "",
          "role": "ADMIN"
        })
        .then((result) => ApiResponse<User>.fromJson(result.data))
        .handler((error) => ApiResponse<User>.onError(error));
  }

  static Future<ApiResponse<Store>> getStoreInfo(
    BuildContext context,
  ) async {
    return await ApiConfigure(context)
        .get('store/get-info')
        .then((result) => ApiResponse<Store>.fromJson(result.data))
        .handler((error) => ApiResponse<Store>.onError(error));
  }
}
