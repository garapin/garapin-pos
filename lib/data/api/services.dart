import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:pos/data/api/error_handler.dart';
import 'package:pos/data/models/base/product.dart';
import 'package:pos/data/models/base/store.dart';
import 'package:pos/engine/engine.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import '../models/base/category.dart';
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

  static Future<ApiResponseList<Product>> catalog(
    BuildContext context, {
    required String search,
    required String category,
  }) async {
    return await ApiConfigure(context)
        .get('store/product?search=$search&category=$category')
        .then((result) => ApiResponseList<Product>.fromJson(result.data))
        .handler((error) => ApiResponseList<Product>.onError(error));
  }

  static Future<ApiResponseList<CategoryProduct>> category(
    BuildContext context,
  ) async {
    return await ApiConfigure(context)
        .get('store/category')
        .then(
            (result) => ApiResponseList<CategoryProduct>.fromJson(result.data))
        .handler((error) => ApiResponseList<CategoryProduct>.onError(error));
  }

  static Future<ApiResponse> updateProfile(BuildContext context,
      {required String storeName,
      required String picName,
      required String phonenumber,
      required String address,
      required String city,
      required String country,
      required String stateAddress,
      required String postalCode,
      required String base64}) async {
    return await ApiConfigure(context)
        .post('store/update', params: {
          "store_name": storeName,
          "pic_name": picName,
          "phone_number": phonenumber,
          "address": address,
          "city": city,
          "country": country,
          "state": stateAddress,
          "postal_code": postalCode,
          "store_image": base64,
        })
        .then((result) => ApiResponse.fromJson(result.data))
        .handler((error) => ApiResponse.onError(error));
  }

  static Future<ApiResponse> regiterCashier(
    BuildContext context, {
    required String email,
  }) async {
    return await ApiConfigure(context)
        .post('store/register_cashier',
            params: {"email": email, "connection_string": ""})
        .then((result) => ApiResponse.fromJson(result.data))
        .handler((error) => ApiResponse.onError(error));
  }

  static Future<ApiResponse> removeCashier(BuildContext context,
      {required String idUser, required String idDatabaseName}) async {
    return await ApiConfigure(context)
        .post('store/remove_cashier',
            params: {"id_user": idUser, "id_database": idDatabaseName})
        .then((result) => ApiResponse.fromJson(result.data))
        .handler((error) => ApiResponse.onError(error));
  }
}
