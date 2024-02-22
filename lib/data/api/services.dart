import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:pos/data/api/error_handler.dart';
import 'package:pos/data/models/base/brand.dart';
import 'package:pos/data/models/base/cart.dart';
import 'package:pos/data/models/base/product.dart';
import 'package:pos/data/models/base/store.dart';
import 'package:pos/data/models/base/unit.dart';
import 'package:pos/data/models/request/req_product.dart';
import 'package:pos/engine/engine.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:pos/modules/product/edit_product/cubit/edit_product_cubit.dart';
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

  static Future<ApiResponse<Product>> singleCatalog(
    BuildContext context, {
    required String id,
  }) async {
    return await ApiConfigure(context)
        .get('store/product/$id')
        .then((result) => ApiResponse<Product>.fromJson(result.data))
        .handler((error) => ApiResponse<Product>.onError(error));
  }

  static Future<ApiResponse<Product>> deleteProduct(
    BuildContext context, {
    required String id,
  }) async {
    return await ApiConfigure(context)
        .post('store/product/delete/$id')
        .then((result) => ApiResponse<Product>.fromJson(result.data))
        .handler((error) => ApiResponse<Product>.onError(error));
  }

  static Future<ApiResponse<Brand>> createBrand(BuildContext context,
      {required String nameBrand}) async {
    return await ApiConfigure(context)
        .post('store/brand/create',
            params: {"brand": nameBrand, "production": "-", "description": "-"})
        .then((result) => ApiResponse<Brand>.fromJson(result.data))
        .handler((error) => ApiResponse<Brand>.onError(error));
  }

  static Future<ApiResponse<Brand>> deleteBrand(BuildContext context,
      {required String id}) async {
    return await ApiConfigure(context)
        .post('store/brand/delete/$id')
        .then((result) => ApiResponse<Brand>.fromJson(result.data))
        .handler((error) => ApiResponse<Brand>.onError(error));
  }

  static Future<ApiResponse<CategoryProduct>> deleteCategory(
      BuildContext context,
      {required String id}) async {
    return await ApiConfigure(context)
        .post('store/category/delete/$id')
        .then((result) => ApiResponse<CategoryProduct>.fromJson(result.data))
        .handler((error) => ApiResponse<CategoryProduct>.onError(error));
  }

  static Future<ApiResponse<Unit>> deleteUnit(BuildContext context,
      {required String id}) async {
    return await ApiConfigure(context)
        .post('store/unit/delete/$id')
        .then((result) => ApiResponse<Unit>.fromJson(result.data))
        .handler((error) => ApiResponse<Unit>.onError(error));
  }

  static Future<ApiResponseList<Brand>> brand(
    BuildContext context,
  ) async {
    return await ApiConfigure(context)
        .get('store/brand')
        .then((result) => ApiResponseList<Brand>.fromJson(result.data))
        .handler((error) => ApiResponseList<Brand>.onError(error));
  }

  static Future<ApiResponseList<Unit>> unit(
    BuildContext context,
  ) async {
    return await ApiConfigure(context)
        .get('store/unit')
        .then((result) => ApiResponseList<Unit>.fromJson(result.data))
        .handler((error) => ApiResponseList<Unit>.onError(error));
  }

  static Future<ApiResponse<Unit>> createUnit(BuildContext context,
      {required String nameUnit}) async {
    return await ApiConfigure(context)
        .post('store/unit/create',
            params: {"unit": nameUnit, "description": "-"})
        .then((result) => ApiResponse<Unit>.fromJson(result.data))
        .handler((error) => ApiResponse<Unit>.onError(error));
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

  static Future<ApiResponse> createCategory(BuildContext context,
      {required String nameCategory}) async {
    return await ApiConfigure(context)
        .post('store/category/create',
            params: {"category": nameCategory, "description": ""})
        .then((result) => ApiResponse.fromJson(result.data))
        .handler((error) => ApiResponse.onError(error));
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

  static Future<ApiResponse> createProduct(BuildContext context,
      {required ReqProduct product}) async {
    return await ApiConfigure(context)
        .post('store/product/create', params: product.toJson())
        .then((result) => ApiResponse.fromJson(result.data))
        .handler((error) => ApiResponse.onError(error));
  }

  static Future<ApiResponse> editProduct(BuildContext context,
      {required ReqProduct product}) async {
    return await ApiConfigure(context)
        .post('store/product/edit', params: product.toJson())
        .then((result) => ApiResponse.fromJson(result.data))
        .handler((error) => ApiResponse.onError(error));
  }

  static Future<ApiResponse<Cart>> getCart(BuildContext context,
      {required String idUser}) async {
    return await ApiConfigure(context)
        .get('store/cart/$idUser')
        .then((result) => ApiResponse<Cart>.fromJson(result.data))
        .handler((error) => ApiResponse<Cart>.onError(error));
  }

  static Future<ApiResponse<Cart>> addToCart(BuildContext context,
      {required String idProduct, required int quantity}) async {
    return await ApiConfigure(context)
        .post('store/cart/create', params: {
          "id_user": Sessions.getUserModel()!.id,
          "id_product": idProduct,
          "quantity": quantity
        })
        .then((result) => ApiResponse<Cart>.fromJson(result.data))
        .handler((error) => ApiResponse<Cart>.onError(error));
  }

  static Future<ApiResponseList<String>> getIconProduct(
    BuildContext context,
  ) async {
    return await ApiConfigure(context)
        .get(
          'store/product/icon',
        )
        .then((result) => ApiResponseList<String>.fromJson(result.data))
        .handler((error) => ApiResponseList<String>.onError(error));
  }
}
