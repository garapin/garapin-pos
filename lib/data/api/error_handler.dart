import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import 'network_exceptions.dart';
import 'response.dart';

///
/// Created by alfianhpratama on 08/11/22
///

class ErrorHandler {
  static BaseResponse getDioException(error) {
    int status = 405;
    if (error is Exception) {
      try {
        NetworkExceptions networkExceptions;
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.connectionTimeout:
              networkExceptions = const NetworkExceptions.requestTimeout();
              break;
            case DioExceptionType.sendTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
            case DioExceptionType.receiveTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
            case DioExceptionType.badResponse:
              status = error.response?.statusCode ?? 405;
              switch (error.response?.statusCode) {
                case 400:
                  networkExceptions = NetworkExceptions.defaultError(
                      error.response!.data["message"]);
                  break;
                case 401:
                  networkExceptions =
                      const NetworkExceptions.unauthorisedRequest();
                  break;
                case 403:
                  networkExceptions =
                      const NetworkExceptions.unauthorisedRequest();
                  break;
                case 404:
                  networkExceptions =
                      const NetworkExceptions.notFound("Not found");
                  break;
                case 409:
                  networkExceptions = const NetworkExceptions.conflict();
                  break;
                case 408:
                  networkExceptions = const NetworkExceptions.requestTimeout();
                  break;
                case 500:
                  networkExceptions =
                      const NetworkExceptions.internalServerError();
                  break;
                case 503:
                  networkExceptions =
                      const NetworkExceptions.serviceUnavailable();
                  break;
                default:
                  var responseCode = error.response?.statusCode;
                  networkExceptions = NetworkExceptions.defaultError(
                    "Received invalid status code: $responseCode",
                  );
              }
              break;
            case DioExceptionType.cancel:
              networkExceptions = const NetworkExceptions.requestCancelled();
              break;
            case DioExceptionType.unknown:
              networkExceptions =
                  NetworkExceptions.defaultError("Error ${error.message}");
              break;
            case DioExceptionType.badCertificate:
              networkExceptions =
                  NetworkExceptions.defaultError("Error ${error.message}");
            case DioExceptionType.connectionError:
              networkExceptions =
                  NetworkExceptions.defaultError("Error ${error.message}");
          }
        } else if (error is SocketException) {
          networkExceptions = const NetworkExceptions.noInternetConnection();
        } else {
          networkExceptions = const NetworkExceptions.unexpectedError();
        }
        return BaseResponse(
            status: status, message: getErrorMessage(networkExceptions));
      } on FormatException {
        return BaseResponse(
          status: status,
          message: getErrorMessage(const NetworkExceptions.formatException()),
        );
      } catch (_) {
        return BaseResponse(
          status: status,
          message: getErrorMessage(const NetworkExceptions.unexpectedError()),
        );
      }
    } else {
      log(error.toString());
      if (error.toString().contains("is not a subtype of")) {
        return BaseResponse(
          status: status,
          message: getErrorMessage(const NetworkExceptions.unableToProcess()),
        );
      } else {
        return BaseResponse(
          status: status,
          message: getErrorMessage(
            NetworkExceptions.defaultError(error.toString()),
          ),
        );
      }
    }
  }

  static String getErrorMessage(NetworkExceptions networkExceptions) {
    var errorMessage = "";
    networkExceptions.when(notImplemented: () {
      errorMessage = "Not Implemented";
    }, requestCancelled: () {
      errorMessage = "Request Cancelled";
    }, internalServerError: () {
      errorMessage = "Internal Server Error";
    }, notFound: (String reason) {
      errorMessage = reason;
    }, serviceUnavailable: () {
      errorMessage = "Service unavailable";
    }, methodNotAllowed: () {
      errorMessage = "Method Allowed";
    }, badRequest: () {
      errorMessage = "Bad request";
    }, unauthorisedRequest: () {
      errorMessage = "Unauthorised request";
    }, unexpectedError: () {
      errorMessage = "Unexpected error occurred";
    }, requestTimeout: () {
      errorMessage = "Connection request timeout";
    }, noInternetConnection: () {
      errorMessage = "No internet connection";
    }, conflict: () {
      errorMessage = "Error due to a conflict";
    }, sendTimeout: () {
      errorMessage = "Send timeout in connection with API server";
    }, unableToProcess: () {
      errorMessage = "Unable to process the data";
    }, defaultError: (String error) {
      errorMessage = error;
    }, formatException: () {
      errorMessage = "Unexpected error occurred";
    }, notAcceptable: () {
      errorMessage = "Not acceptable";
    });
    return errorMessage;
  }
}

extension FutureExt<T> on Future<T> {
  Future<T> summarizeError() {
    return onError((error, stackTrace) async {
      log('$error $stackTrace');
      throw ErrorHandler.getDioException(error);
    });
  }

  Future<T> handler(Function onError) async {
    return summarizeError().catchError(onError);
  }
}
