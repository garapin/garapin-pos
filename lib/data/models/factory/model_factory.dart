import 'dart:developer';

import 'package:pos/data/models/base/config_version_apps.dart';
import 'package:pos/data/models/base/split_rule.dart';

import '../base/account_balance.dart';
import '../base/available_payment.dart';
import '../base/brand.dart';
import '../base/cart.dart';
import '../base/category.dart';
import '../base/database_store.dart';
import '../base/filter_store_transaction.dart';
import '../base/history_transaction.dart';
import '../base/invoices.dart';
import '../base/merchant_model.dart';
import '../base/payment_cash.dart';
import '../base/product.dart';
import '../base/qrcode.dart';

import '../base/split_payment_detail.dart';
import '../base/split_payment_template.dart';
import '../base/store.dart';
import '../base/unit.dart';
import '../base/user_database.dart';
import '../base/virtual_account.dart';

Object factoryModel(String type, {Map<String, dynamic>? json}) {
  switch (type) {
    case 'User':
      return json != null ? User.fromJson(json) : User();
    case 'Store':
      return json != null ? Store.fromJson(json) : Store();
    case 'Product':
      return json != null ? Product.fromJson(json) : Product();
    case 'CategoryProduct':
      return json != null ? CategoryProduct.fromJson(json) : CategoryProduct();
    case 'Brand':
      return json != null ? Brand.fromJson(json) : Brand();
    case 'Unit':
      return json != null ? Unit.fromJson(json) : Unit();
    case 'Cart':
      return json != null ? Cart.fromJson(json) : Cart();
    case 'Invoices':
      return json != null ? Invoices.fromJson(json) : Invoices();
    case 'QrCode':
      return json != null ? QrCode.fromJson(json) : QrCode();
    case 'VirtualAccount':
      return json != null ? VirtualAccount.fromJson(json) : VirtualAccount();
    case 'AvailablePayment':
      return json != null
          ? AvailablePayment.fromJson(json)
          : AvailablePayment();
    case 'PaymentCash':
      return json != null ? PaymentCash.fromJson(json) : PaymentCash();
    case 'MerchantModel':
      return json != null ? MerchantModel.fromJson(json) : MerchantModel();
    case 'DatabaseStore':
      return json != null ? DatabaseStore.fromJson(json) : DatabaseStore();
    case 'AccountBalance':
      return json != null ? AccountBalance.fromJson(json) : AccountBalance();
    case 'SplitRule':
      return json != null ? SplitRule.fromJson(json) : SplitRule();
    case 'UserDatabase':
      return json != null ? UserDatabase.fromJson(json) : UserDatabase();
    case 'ConfigVersionApps':
      return json != null
          ? ConfigVersionApps.fromJson(json)
          : ConfigVersionApps();
    case 'SplitPaymentTemplate':
      return json != null
          ? SplitPaymentTemplate.fromJson(json)
          : SplitPaymentTemplate();
    case 'HistoryTransaction':
      return json != null
          ? HistoryTransaction.fromJson(json)
          : HistoryTransaction();
    case 'FilterStoreTransaction':
      return json != null
          ? FilterStoreTransaction.fromJson(json)
          : FilterStoreTransaction();
    case 'SplitPaymentDetail':
      return json != null
          ? SplitPaymentDetail.fromJson(json)
          : SplitPaymentDetail();
    case 'dynamic':
      return json != null ? DefaultModel(json) : DefaultModel({});
    default:
      throw '$type factory unimplemented!';
  }
}

abstract class ModelFactory {
  static Object fromJson(Type type, Map<String, dynamic> json) {
    String strType = type.toString().trim().replaceAll("?", "");
    return factoryModel(strType, json: json);
  }
}

class DefaultModel {
  dynamic result;
  String? warning;

  DefaultModel(this.result, {this.warning}) {
    log('$warning');
  }
}
