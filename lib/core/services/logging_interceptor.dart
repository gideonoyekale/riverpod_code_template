import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../cores.dart';

class LoggingInterceptor extends QueuedInterceptor {
  Function() onLogout;

  LoggingInterceptor({required this.onLogout});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      Console.log('==>', '<== REQUEST ==>');
      Console.log(
          'REQUEST[${options.method}]', '==> ${options.uri.toString()}');
      if (options.data is FormData) {
        Console.log('Data', '---> ${(options.data as FormData).fields}');
        Console.log('Files', '---> ${(options.data as FormData).files}');
      } else {
        Console.log('Data', '---> ${options.data}');
      }
      Console.log("Auth", "--> ${options.headers['Authorization']}");
      Console.log("x-location", "--> ${options.headers['x-location']}");
      Console.log('Params', "--> ${options.queryParameters}");
      Console.log("Content Type", "--> ${options.contentType}");
      Console.log("END", "----------------->");
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      Console.log('==>', '<== RESPONSE ==>');
      Console.log('RESPONSE[${response.statusCode}]',
          '=> PATH: ${response.requestOptions.uri.toString()}');
      Console.log('Data', '=> ${response.data}');
      Console.log("END", "----------------->");
      print("<-- END HTTP");
    }
    // if (response.data != null &&
    //     response.data is! List &&
    //     (!(response.data['success'] ?? false) &&
    //         !(response.data['status'] ?? false))) {
    //   handler.reject(
    //     DioException.badResponse(
    //       statusCode: response.statusCode ?? 200,
    //       requestOptions: response.requestOptions,
    //       response: response,
    //     ),
    //   );
    // }
    return super.onResponse(response, handler);
  }

  // final _cache = <Uri, Response>{};

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      Console.log('==>', "<== ERROR ==>");
      Console.log(
        'ERROR[${err.response?.statusCode}]',
        ' => PATH: ${err.requestOptions.uri.toString()}',
      );
      Console.log('Error', "-->  ${err.error}");
      Console.log('Data', "--> ${err.response?.data}");
    }

    err = err.copyWith(message: _handleError(err));

    return super.onError(err, handler);
  }

  String _handleError(DioException dioError) {
    String errorDescription = "";

    switch (dioError.type) {
      case DioExceptionType.cancel:
        errorDescription = "Request to server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        errorDescription = "Connection timeout. Please try again!";
        break;
      case DioExceptionType.unknown:
        errorDescription = "Something went wrong";
        break;
      case DioExceptionType.receiveTimeout:
        errorDescription = "Receive timeout in connection with server";
        break;
      case DioExceptionType.sendTimeout:
        errorDescription = "Send timeout in connection with server";
        break;
      case DioExceptionType.badCertificate:
        errorDescription = "Bad certificate";
        break;
      case DioExceptionType.badResponse:
        errorDescription = "Bad response";
        errorDescription =
            dioError.response?.data.toString() ?? 'Something went wrong!';

        break;
      case DioExceptionType.connectionError:
        errorDescription =
            "Connection to server failed due to internet connection";
        break;
    }

    return errorDescription;
  }
}
