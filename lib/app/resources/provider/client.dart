import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:werewolf_client/app/constants/constants.dart';
import 'package:werewolf_client/app/utils/utils.dart';

class AppClients extends DioForNative {
  static const String GET = "GET";
  static const String POST = "POST";
  static const String PUT = "PUT";
  static const String DELETE = "DELETE";

  static AppClients _instance;

  factory AppClients(
      {String baseUrl = AppEndpoint.BASE_URL, BaseOptions options}) {
    if (_instance == null)
      _instance = AppClients._(baseUrl: baseUrl, options: options);
    if (options != null) _instance.options = options;
    _instance.options.baseUrl = baseUrl;
    return _instance;
  }

  AppClients._({String baseUrl = AppEndpoint.BASE_URL, BaseOptions options})
      : super(options) {
    this.interceptors.add(InterceptorsWrapper(
          onRequest: _requestInterceptor,
          onResponse: _responseInterceptor,
          onError: _errorInterceptor,
        ));
    this.options.baseUrl = baseUrl;
  }

  _requestInterceptor(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers
        .addEntries([MapEntry('Authorization', AppPref.accessToken)]);
    switch (options.method) {
      case AppClients.GET:
        log("${options.method}: ${options.uri}\nParams: ${options.queryParameters}");
        break;
      case AppClients.POST:
        if (options.data is Map) {
          log("${options.method}: ${options.uri}\nParams: ${options.data}");
          options.contentType = 'application/x-www-form-urlencoded';
        } else if (options.data is FormData) {
          log("${options.method}: ${options.uri}\nParams: ${options.data.fields}");
        }
        break;
      default:
        break;
    }
    options.connectTimeout = AppEndpoint.connectionTimeout;
    options.receiveTimeout = AppEndpoint.receiveTimeout;
    handler.next(options);
  }

  _responseInterceptor(Response response, ResponseInterceptorHandler handler) {
    log("Response ${response.requestOptions.uri}: ${response.statusCode}\nData: ${response.data}");
    handler.next(response);
  }

  _errorInterceptor(DioError dioError, ErrorInterceptorHandler handler) {
    log("${dioError.type} - Error ${dioError.message}");
    handler.next(dioError);
  }
}
