import 'dart:developer';
import 'dart:io';
import 'package:abditrack_inventory/data/api/error_handler.dart';
import 'package:abditrack_inventory/data/models/base/cart.dart';
import 'package:abditrack_inventory/data/models/base/instalation_vehicle.dart';
import 'package:abditrack_inventory/data/models/base/product.dart';
import 'package:abditrack_inventory/data/models/base/item.dart';
import 'package:abditrack_inventory/data/models/base/rules_scan.dart';
import 'package:abditrack_inventory/data/models/base/transaction.dart';
import 'package:abditrack_inventory/data/models/base/transaction_item.dart';
import 'package:abditrack_inventory/data/models/base/user.dart';
import 'package:abditrack_inventory/engine/engine.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

  static Future<ApiResponse> createUser(BuildContext context,
      {required Map<String, dynamic> params}) async {
    return await ApiConfigure(context)
        .post('user/create', params: params)
        .then((result) => ApiResponse.fromJson(result.data))
        .handler((error) => ApiResponse.onError(error));
  }

  static Future<ApiResponse<User>> getUserId(
    BuildContext context,
  ) async {
    return await ApiConfigure(context)
        .get('user/${Sessions.getUserModel()?.id}')
        .then((result) => ApiResponse<User>.fromJson(result.data))
        .handler((error) => ApiResponse<User>.onError(error));
  }

  static Future<ApiResponse<User>> login(BuildContext context,
      {required String email, required String password}) async {
    return await ApiConfigure(context)
        .post('/user/login', params: {"email": email, "password": password})
        .then((result) => ApiResponse<User>.fromJson(result.data))
        .handler((error) => ApiResponse<User>.onError(error));
  }

  static Future<ApiResponseList<User>> getUsers(
    BuildContext context,
  ) async {
    return await ApiConfigure(context)
        .get('user')
        .then((result) => ApiResponseList<User>.fromJson(result.data))
        .handler((error) => ApiResponseList<User>.onError(error));
  }

  static Future<ApiResponseList<Product>> productAll(BuildContext context,
      {required String status,
      required int page,
      required String search,
      required String sort}) async {
    return await ApiConfigure(context)
        .get(
            'product?status=$status&page=$page&search=${search.toLowerCase()}&sort=${sort.toLowerCase()}')
        .then((result) => ApiResponseList<Product>.fromJson(result.data))
        .handler((error) => ApiResponseList<Product>.onError(error));
  }

  static Future<ApiResponse> addProduct(BuildContext context,
      {required String name,
      required String codeProduct,
      required String desc,
      required String scanImei,
      required String scanSn,
      required String base64}) async {
    return await ApiConfigure(context)
        .post('product/create', params: {
          "name": name,
          "code_product": codeProduct,
          "description": desc,
          "image": base64,
          "scan_imei": scanImei,
          "scan_sn": scanSn,
        })
        .then((result) => ApiResponse.fromJson(result.data))
        .handler((error) => ApiResponse.onError(error));
  }

  static Future<ApiResponse<RulesScan>> checkRulesScanProduct(
    BuildContext context, {
    required String codeProduct,
  }) async {
    return await ApiConfigure(context)
        .post('product/check_rules_scan', params: {"code_product": codeProduct})
        .then((result) => ApiResponse<RulesScan>.fromJson(result.data))
        .handler((error) => ApiResponse<RulesScan>.onError(error));
  }

  static Future<ApiResponseList<Item>> getAllItem(
    BuildContext context,
  ) async {
    return await ApiConfigure(context)
        .get('product/detail')
        .then((result) => ApiResponseList<Item>.fromJson(result.data))
        .handler((error) => ApiResponseList<Item>.onError(error));
  }

  static Future<ApiResponseList<Item>> getItemByProductID(BuildContext context,
      {required String id,
      required int page,
      required String search,
      required String status}) async {
    return await ApiConfigure(context)
        .get('product/item/$id?page=$page&search=$search&status=$status')
        .then((result) => ApiResponseList<Item>.fromJson(result.data))
        .handler((error) => ApiResponseList<Item>.onError(error));
  }

  static Future<ApiResponse<dynamic>> addItem(BuildContext context,
      {String? imei, String? noSn, String? noProduct}) async {
    return await ApiConfigure(context)
        .post('product/item/create', params: {
          "imei": imei,
          "no_sn": noSn,
          "no_product": noProduct,
          "status": "in",
          "id_user": Sessions.getUserModel()?.id
        })
        .then((result) => ApiResponse<dynamic>.fromJson(result.data))
        .handler((error) => ApiResponse<dynamic>.onError(error));
  }

  static Future<ApiResponseList<Cart>> cartById(
    BuildContext context,
  ) async {
    return await ApiConfigure(context)
        .get('cart/${Sessions.getUserModel()?.id}')
        .then((result) => ApiResponseList<Cart>.fromJson(result.data))
        .handler((error) => ApiResponseList<Cart>.onError(error));
  }

  static Future<ApiResponse<dynamic>> addToCart(BuildContext context,
      {String? imei, String? noSn, String? noProduct}) async {
    return await ApiConfigure(context)
        .post('cart/create', params: {
          "imei": imei,
          "no_sn": noSn,
          "no_product": noProduct,
          "id_user": Sessions.getUserModel()?.id
        })
        .then((result) => ApiResponse<dynamic>.fromJson(result.data))
        .handler((error) => ApiResponse<dynamic>.onError(error));
  }

  static Future<ApiResponse<dynamic>> addTransaction(BuildContext context,
      {required String base64,
      required String notes,
      required String transactionPurpose,
      required List<String> idProductItem,
      required List<int> listTeknisi,
      String? noProduct}) async {
    return await ApiConfigure(context)
        .post('transaction/create', params: {
          "transaction_purpose": transactionPurpose,
          "signature_image": base64,
          "notes": notes,
          "id_product_item": idProductItem,
          "list_id_teknisi": listTeknisi,
          "id_user": Sessions.getUserModel()?.id
        })
        .then((result) => ApiResponse<dynamic>.fromJson(result.data))
        .handler((error) => ApiResponse<dynamic>.onError(error));
  }

  static Future<ApiResponseList<Transaction>> getListTransaction(
    BuildContext context, {
    required String status,
  }) async {
    return await ApiConfigure(context)
        .get('transaction?status=$status')
        .then((result) => ApiResponseList<Transaction>.fromJson(result.data))
        .handler((error) => ApiResponseList<Transaction>.onError(error));
  }

  static Future<ApiResponseList<Transaction>> getListTransactionByTeknisi(
      BuildContext context,
      {required String status}) async {
    return await ApiConfigure(context)
        .get(
            'transaction/teknisi/${Sessions.getUserModel()!.id}?status=$status')
        .then((result) => ApiResponseList<Transaction>.fromJson(result.data))
        .handler((error) => ApiResponseList<Transaction>.onError(error));
  }

  static Future<ApiResponse<Transaction>> getTransactionDetail(
    BuildContext context, {
    required int id,
  }) async {
    return await ApiConfigure(context)
        .get('transaction/$id')
        .then((result) => ApiResponse<Transaction>.fromJson(result.data))
        .handler((error) => ApiResponse<Transaction>.onError(error));
  }

  static Future<ApiResponseList<TransactionItem>> getTransactionItem(
    BuildContext context, {
    required int id,
  }) async {
    return await ApiConfigure(context)
        .get('transaction/item/$id')
        .then(
            (result) => ApiResponseList<TransactionItem>.fromJson(result.data))
        .handler((error) => ApiResponseList<TransactionItem>.onError(error));
  }

  static Future<ApiResponse> instalationVehicleCreate(
    BuildContext context, {
    required List<String> instalationImages,
    required List<int> idTransactionItem,
    required List<int> idProductItem,
    required int idMitra,
    required String vehicleName,
    required String vehicleNo,
    required String odoMeter,
    required String memory,
  }) async {
    return await ApiConfigure(context)
        .post('instalation_vehicle/create', params: {
          "id_transaction_item": idTransactionItem,
          "id_product_item": idProductItem,
          "id_mitra": idMitra,
          "vehicle_name": vehicleName,
          "vehicle_no": vehicleNo,
          "odo_meter": odoMeter,
          "memory": memory,
          "instalation_images": instalationImages,
          "created": DateTime.now().toString(),
          "updated": DateTime.now().toString(),
        })
        .then((result) => ApiResponse.fromJson(result.data))
        .handler((error) => ApiResponse.onError(error));
  }

  static Future<ApiResponseList<InstalationVehicle>>
      getInsalationVehicleByIdTransaction(
    BuildContext context, {
    required int idTransaction,
  }) async {
    return await ApiConfigure(context)
        .get('instalation_vehicle/$idTransaction')
        .then((result) =>
            ApiResponseList<InstalationVehicle>.fromJson(result.data))
        .handler((error) => ApiResponseList<InstalationVehicle>.onError(error));
  }

  static Future<ApiResponseList<InstalationVehicle>>
      getInsalationVehicleByVehicleNo(
    BuildContext context, {
    required int vehicleNo,
  }) async {
    return await ApiConfigure(context)
        .get('instalation_vehicle/vehicle/$vehicleNo')
        .then((result) =>
            ApiResponseList<InstalationVehicle>.fromJson(result.data))
        .handler((error) => ApiResponseList<InstalationVehicle>.onError(error));
  }

  static Future<ApiResponseList<InstalationVehicle>>
      getInsalationVehicleByItemId(BuildContext context,
          {required int idProductItem}) async {
    return await ApiConfigure(context)
        .get('instalation_vehicle/item/$idProductItem')
        .then((result) =>
            ApiResponseList<InstalationVehicle>.fromJson(result.data))
        .handler((error) => ApiResponseList<InstalationVehicle>.onError(error));
  }

  static Future<ApiResponse> transactionUpdateStatus(
    BuildContext context, {
    required int idTransaction,
    required String status,
  }) async {
    return await ApiConfigure(context)
        .post('transaction/update_status',
            params: {"id_transaction": idTransaction, "status": status})
        .then((result) => ApiResponse.fromJson(result.data))
        .handler((error) => ApiResponse.onError(error));
  }

  static Future<ApiResponse> transactionUpdateStatusReturn(BuildContext context,
      {required List<int> listIdItem,
      required int idTransaction,
      required String statusItem,
      required String statusTransaction}) async {
    return await ApiConfigure(context)
        .post('transaction/update_status_return', params: {
          "list_id_item": listIdItem,
          "id_transaction": idTransaction,
          "status_item": statusItem,
          "status_transaction": statusTransaction
        })
        .then((result) => ApiResponse.fromJson(result.data))
        .handler((error) => ApiResponse.onError(error));
  }
}
