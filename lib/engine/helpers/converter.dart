import 'dart:developer';
import 'package:json_annotation/json_annotation.dart';
import '../../data/models/factory/model_factory.dart';

class Converter<T> implements JsonConverter<T, Object> {
  const Converter();

  @override
  T fromJson(Object json) {
    try {
      if (json is Map<String, dynamic>) {
        return ModelFactory.fromJson(T, json) as T;
      }
      return json as T;
    } catch (e) {
      log('Converter error $T => $e');
      return ModelFactory.fromJson(T, json as Map<String, dynamic>) as T;
    }
  }

  @override
  Object toJson(T object) => (object as Object);
}

class ConverterStringToInt implements JsonConverter<int, dynamic> {
  const ConverterStringToInt();

  @override
  int fromJson(dynamic json) {
    try {
      if (json is num) return json.toInt();
      return int.tryParse(json) ?? 0;
    } catch (e) {
      return 0;
    }
  }

  @override
  String toJson(int object) => object.toString();
}

class ConverterForceString implements JsonConverter<String?, dynamic> {
  const ConverterForceString();

  @override
  String? fromJson(dynamic json) {
    if (json == null || json.toString().isEmpty) return null;
    return json.toString();
  }

  @override
  String? toJson(String? object) => object;
}

class ConverterForceInt implements JsonConverter<int?, dynamic> {
  const ConverterForceInt();

  @override
  int? fromJson(dynamic json) {
    if (json == null || json.toString().isEmpty) return null;
    if (json is double) {
      return json.toInt();
    } else if (json is String) {
      return int.tryParse(json);
    } else {
      return json;
    }
  }

  @override
  int? toJson(int? object) => object;
}

class ConverterToHexString implements JsonConverter<String?, dynamic> {
  const ConverterToHexString();

  @override
  String fromJson(dynamic json) {
    if (json == null || json.toString().isEmpty) return 'FFFFFF';
    return json.toString().replaceAll(RegExp('[^A-Za-z0-9]'), '');
  }

  @override
  String toJson(String? object) => object ?? 'FFFFFF';
}
