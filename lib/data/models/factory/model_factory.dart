import 'dart:developer';

import '../base/category.dart';
import '../base/product.dart';
import '../base/store.dart';
import '../base/user.dart';

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
