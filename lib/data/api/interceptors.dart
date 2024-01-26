import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../engine/configs/main_cubit.dart';
import '../../engine/helpers/constants.dart';
import '../../engine/helpers/sessions.dart';
import 'response.dart';
import 'services.dart';

class ApiInterceptors extends InterceptorsWrapper {
  final Dio dio;
  final BuildContext context;

  ApiInterceptors(this.dio, this.context);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('=================Error==================');
    log('Response ${err.requestOptions.uri}');
    log('Error => ${err.error}');
    log('Error Data => ${err.response?.data}');
    log('=============E==R==R==O==R==============');
    super.onError(err, handler);
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String data = '${options.data}';
    if (options.data is FormData) {
      data = (options.data as FormData).fields.toString();
    }
    log('=================Request=================');
    log('${options.method.toUpperCase()} ${options.uri} ${options.path}');
    log('Header => ${options.headers}');
    log('Parameter => ${options.extra}'); //extra, queryparam
    log('Data => $data');
    log('============R==E==Q==U==E==S==T===========');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    BaseResponse res = BaseResponse.fromJson(response.data);
    if (res.status == APIResult.invalid) {
      var result = await forceRefreshToken(response);
      if (result != null) {
        handler.resolve(result);
      } else {
        handler.reject(
          DioException(
            requestOptions: response.requestOptions,
            type: DioExceptionType.badResponse,
            response: response,
          ),
        );
      }
    } else {
      log('=================Result==================');
      log('Response ${response.realUri}');
      log('Data => ${jsonEncode(response.data)}');
      log('============R==E==S==U==L==T=============');
      BaseResponse base = BaseResponse.fromJson(response.data);

      context.read<MainCubit>().changeTheme();

      super.onResponse(response, handler);
    }
  }

  Future<Response<dynamic>?> forceRefreshToken(Response response) async {
    final res = await ApiService.getToken(context);
    if (res.isSuccess) {
      String token = response.data!;
      await Sessions.setToken(token);
      response.requestOptions.headers["token"] = token;
      final opts = Options(
        method: response.requestOptions.method,
        headers: response.requestOptions.headers,
      );
      final cloneReq = await dio.request(
        response.requestOptions.path,
        options: opts,
        data: response.requestOptions.data,
        queryParameters: response.requestOptions.queryParameters,
      );
      return cloneReq;
    } else {
      return null;
    }
  }
}
