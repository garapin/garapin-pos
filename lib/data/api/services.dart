import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:pos/data/api/error_handler.dart';
import 'package:pos/data/models/base/available_payment.dart';
import 'package:pos/data/models/base/bank_account.dart';
import 'package:pos/data/models/base/brand.dart';
import 'package:pos/data/models/base/bussiness_partner.dart';
import 'package:pos/data/models/base/cart.dart';
import 'package:pos/data/models/base/database_store.dart';
import 'package:pos/data/models/base/invoices.dart';
import 'package:pos/data/models/base/payment_cash.dart';
import 'package:pos/data/models/base/product.dart';
import 'package:pos/data/models/base/qrcode.dart';
import 'package:pos/data/models/base/store.dart';
import 'package:pos/data/models/base/unit.dart';
import 'package:pos/data/models/base/virtual_account.dart';
import 'package:pos/data/models/request/req_product.dart';
import 'package:pos/data/models/request/req_register_bank.dart';
import 'package:pos/engine/engine.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:pos/modules/product/edit_product/cubit/edit_product_cubit.dart';
import '../models/base/category.dart';
import '../models/base/merchant_model.dart';
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

  static Future<ApiResponse<Store>> updateProfile(BuildContext context,
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
          "account_holder": {
            "email": Sessions.getUserModel()!.email,
            "type": "OWNED",
            "public_profile": {"business_name": storeName}
          }
        })
        .then((result) => ApiResponse<Store>.fromJson(result.data))
        .handler((error) => ApiResponse<Store>.onError(error));
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

  static Future<ApiResponse<Cart>> clearCart(
    BuildContext context,
  ) async {
    return await ApiConfigure(context)
        .post('store/cart/clear_all', params: {
          "id_user": Sessions.getUserModel()!.id,
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

  static Future<ApiResponse<Invoices>> createInvoice(
    BuildContext context, {
    required String idCart,
    required int amount,
    required String payerEmail,
  }) async {
    return await ApiConfigure(context)
        .post('store/transcation/create-invoices', params: {
          "cart_id": idCart,
          "amount": amount,
          "payer_email": payerEmail,
        })
        .then((result) => ApiResponse<Invoices>.fromJson(result.data))
        .handler((error) => ApiResponse<Invoices>.onError(error));
  }

  static Future<ApiResponse<Invoices>> getSingleInvoices(
    BuildContext context, {
    required String invoices,
  }) async {
    return await ApiConfigure(context)
        .get('store/transcation/invoces/$invoices')
        .then((result) => ApiResponse<Invoices>.fromJson(result.data))
        .handler((error) => ApiResponse<Invoices>.onError(error));
  }

  static Future<ApiResponse<Invoices>> cancelOrder(
    BuildContext context, {
    required String invoices,
  }) async {
    return await ApiConfigure(context)
        .get('store/transcation/invoces/cancel/$invoices')
        .then((result) => ApiResponse<Invoices>.fromJson(result.data))
        .handler((error) => ApiResponse<Invoices>.onError(error));
  }

  static Future<ApiResponse<QrCode>> createQrcode(BuildContext context,
      {required String invoices, required int amount}) async {
    return await ApiConfigure(context)
        .post('store/transcation/create-qrcode',
            params: {"reference_id": invoices, "amount": amount})
        .then((result) => ApiResponse<QrCode>.fromJson(result.data))
        .handler((error) => ApiResponse<QrCode>.onError(error));
  }

  static Future<ApiResponse<VirtualAccount>> createVirtualAccount(
      BuildContext context,
      {required String invoice,
      required String bankCode}) async {
    return await ApiConfigure(context)
        .post('store/transcation/create-va',
            params: {"external_id": invoice, "bank_code": bankCode})
        .then((result) => ApiResponse<VirtualAccount>.fromJson(result.data))
        .handler((error) => ApiResponse<VirtualAccount>.onError(error));
  }

  static Future<ApiResponse<QrCode>> getQrCode(BuildContext context,
      {required String idQr}) async {
    return await ApiConfigure(context)
        .get('store/transcation/qrcode/$idQr')
        .then((result) => ApiResponse<QrCode>.fromJson(result.data))
        .handler((error) => ApiResponse<QrCode>.onError(error));
  }

  static Future<ApiResponseList<AvailablePayment>> paymentAvailable(
    BuildContext context,
  ) async {
    return await ApiConfigure(context)
        .get('store/transcation/payment_available')
        .then(
            (result) => ApiResponseList<AvailablePayment>.fromJson(result.data))
        .handler((error) => ApiResponseList<AvailablePayment>.onError(error));
  }

  static Future<ApiResponse<PaymentCash>> paymentCash(BuildContext context,
      {required String invoice, required int amount}) async {
    return await ApiConfigure(context)
        .post('store/transcation/payment-cash',
            params: {"reference_id": invoice, "amount": amount})
        .then((result) => ApiResponse<PaymentCash>.fromJson(result.data))
        .handler((error) => ApiResponse<PaymentCash>.onError(error));
  }

  static Future<ApiResponse<Store>> addBankAccountInProfile(
    BuildContext context, {
    required ReqRegisterBank req,
  }) async {
    return await ApiConfigure(context)
        .post('store/update/add_bank_account', params: req.toJson())
        .then((result) => ApiResponse<Store>.fromJson(result.data))
        .handler((error) => ApiResponse<Store>.onError(error));
  }

  static Future<ApiResponse> createMerchant(
    BuildContext context, {
    required String databaseName,
    required String merchantRole,
    required String email,
  }) async {
    return await ApiConfigure(context)
        .post('store/merchant/create', params: {
          "store_name": databaseName,
          "merchant_role": merchantRole,
          "email": email
        })
        .then((result) => ApiResponse.fromJson(result.data))
        .handler((error) => ApiResponse.onError(error));
  }

  static Future<ApiResponseList<MerchantModel>> getAllMerchanr(
      BuildContext context) async {
    return await ApiConfigure(context)
        .get('store/merchant/all')
        .then((result) => ApiResponseList<MerchantModel>.fromJson(result.data))
        .handler((error) => ApiResponseList<MerchantModel>.onError(error));
  }

  static Future<ApiResponse<MerchantModel>> acceptInvitation(
      BuildContext context,
      {required String status}) async {
    return await ApiConfigure(context)
        .post('/store/merchant/accept_invitation', params: {"status": status})
        .then((result) => ApiResponse<MerchantModel>.fromJson(result.data))
        .handler((error) => ApiResponse<MerchantModel>.onError(error));
  }

  static Future<ApiResponseList<DatabaseStore>> getStoreDatabaseByParent(
      BuildContext context) async {
    return await ApiConfigure(context)
        .get('/store/get_stores_database_id_parent')
        .then((result) => ApiResponseList<DatabaseStore>.fromJson(result.data))
        .handler((error) => ApiResponseList<DatabaseStore>.onError(error));
  }
}
