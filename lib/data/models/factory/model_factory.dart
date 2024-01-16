import 'dart:developer';
import '../base/cart.dart';
import '../base/product.dart';
import '../base/item.dart';
import '../base/transaction.dart';
import '../base/transaction_detail.dart';
import '../base/transaction_item.dart';

Object factoryModel(String type, {Map<String, dynamic>? json}) {
  switch (type) {
    case 'Product':
      return json != null ? Product.fromJson(json) : Product();
    case 'Item':
      return json != null ? Item.fromJson(json) : Item();
    case 'Transaction':
      return json != null ? Transaction.fromJson(json) : Transaction();
    case 'Cart':
      return json != null ? Cart.fromJson(json) : Cart();
    case 'TransactionDetail':
      return json != null
          ? TransactionDetail.fromJson(json)
          : TransactionDetail();
    case 'TransactionItem':
      return json != null ? TransactionItem.fromJson(json) : TransactionItem();
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
