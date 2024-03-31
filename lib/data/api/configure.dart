import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pos/data/api/services.dart';
import '../../engine/configs/environment.dart';
import '../../engine/helpers/sessions.dart';
import '../../widgets/components/check_version.dart';
import 'interceptors.dart';

enum ParamType { formData, jsonBody }

class ApiConfigure {
  final String baseUrl = Environment.baseAPIUrl();
  final BuildContext context;

  late Dio _dio;

  ApiConfigure(this.context) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 8000),
        receiveTimeout: const Duration(seconds: 8000),
        headers: {
          'Content-Type': 'application/json',
          'target-database': Sessions.getDatabaseModel()?.name ?? "",
        },
      ),
    );
    _dio.interceptors.add(ApiInterceptors(_dio, context));
  }

  void config(String path) async {
    checkVersion(context);
    String? token = Sessions.getToken();
    if (token != null) {
      Map<String, dynamic> headers = {'Authorization': token};
      _dio.options.headers.addAll(headers);
    }
  }

  Response onErrorResponse(DioException error) {
    return Response(
      requestOptions: error.requestOptions,
      data: {
        'code': error.response?.statusCode,
        'msg': error.response?.statusMessage,
      },
    );
  }

  Future get(
    String path, {
    Map<String, dynamic>? params,
    bool isDownload = false,
  }) async {
    config(path);
    return await _dio.get(path, queryParameters: params);
  }

  Future post(
    String path, {
    Map<String, dynamic>? params,
    ParamType paramType = ParamType.jsonBody,
  }) async {
    config(path);
    if (params != null) {
      switch (paramType) {
        case ParamType.formData:
          final formData = FormData.fromMap(params);
          return await _dio.post(path, data: formData);
        case ParamType.jsonBody:
          return await _dio.post(path, data: params);
      }
    } else {
      return await _dio.post(path);
    }
  }

  Future put(
    String path, {
    Map<String, dynamic>? params,
    ParamType paramType = ParamType.jsonBody,
  }) async {
    config(path);
    if (params != null) {
      switch (paramType) {
        case ParamType.formData:
          final formData = FormData.fromMap(params);
          return await _dio.put(path, data: formData);

        case ParamType.jsonBody:
          return await _dio.put(path, data: params);
      }
    } else {
      return await _dio.put(path);
    }
  }

  Future patch(
    String path, {
    Map<String, dynamic>? params,
    ParamType paramType = ParamType.jsonBody,
  }) async {
    config(path);
    if (params != null) {
      switch (paramType) {
        case ParamType.formData:
          final formData = FormData.fromMap(params);
          return await _dio.patch(path, data: formData);

        case ParamType.jsonBody:
          return await _dio.patch(path, data: params);
      }
    } else {
      return await _dio.patch(path);
    }
  }

  Future delete(
    String path, {
    Map<String, dynamic>? params,
    ParamType paramType = ParamType.jsonBody,
  }) async {
    config(path);
    if (params != null) {
      switch (paramType) {
        case ParamType.formData:
          final formData = FormData.fromMap(params);
          return await _dio.delete(path, data: formData);

        case ParamType.jsonBody:
          return await _dio.delete(path, data: params);
      }
    } else {
      return await _dio.delete(path);
    }
  }

  Future download(
    String path,
    dynamic savePath, {
    Map<String, dynamic>? params,
    ParamType paramType = ParamType.jsonBody,
    ProgressCallback? onReceiveProgress,
  }) async {
    config(path);
    if (params != null) {
      switch (paramType) {
        case ParamType.formData:
          final formData = FormData.fromMap(params);
          return await _dio.download(
            path,
            savePath,
            data: formData,
            onReceiveProgress: onReceiveProgress,
          );

        case ParamType.jsonBody:
          return await _dio.download(
            path,
            savePath,
            data: params,
            onReceiveProgress: onReceiveProgress,
          );
      }
    } else {
      return await _dio.download(
        path,
        savePath,
        onReceiveProgress: onReceiveProgress,
      );
    }
  }
}
