import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:logger/logger.dart';
import '../constants/constants.dart';
import 'utils.dart';

class AppClients extends DioForNative {
  static const String GET = "GET";
  static const String POST = "POST";
  static const String PUT = "PUT";
  static const String DELETE = "DELETE";

  static AppClients? _instance;
  static Logger logger = Logger();

  factory AppClients({String baseUrl = AppEndpoint.BASE_URL, BaseOptions? options}) {
    if (_instance == null) _instance = AppClients._(baseUrl: baseUrl);
    if (options != null) _instance!.options = options;
    _instance!.options.baseUrl = baseUrl;
    return _instance!;
  }

  AppClients._({String baseUrl = AppEndpoint.BASE_URL, BaseOptions? options}) : super(options) {
    this.interceptors.add(InterceptorsWrapper(
          onRequest: _requestInterceptor,
          onResponse: _responseInterceptor,
          onError: _errorInterceptor,
        ));
    this.options.baseUrl = baseUrl;
  }

  _requestInterceptor(RequestOptions options, RequestInterceptorHandler handler) async {
    String? accessToken = AppPref.accessToken;

    switch (options.method) {
      case AppClients.GET:
        //Remove if contains
        if (options.queryParameters.containsKey("accessToken"))
          options.queryParameters.remove("accessToken");
        //Add again
        options.queryParameters.addAll({
          "accessToken": accessToken,
        });
        logger.i("${options.method}: ${options.uri}\nParams: ${options.queryParameters}");
        break;

      default:
        if (options.data is Map) {
          //Remove if contains
          if (options.data.containsKey("accessToken")) options.data.remove("accessToken");
          //Add again
          options.data.addAll({"accessToken": accessToken});
          logger.i("${options.method}: ${options.uri}\nParams: ${options.data}");
        } else if (options.data is FormData) {
          options.data.fields.addAll([MapEntry("accessToken", accessToken)]);
          logger.i("${options.method}: ${options.uri}\nParams: ${options.data.fields}");
        }
        break;
    }
    options.connectTimeout = AppEndpoint.connectionTimeout;
    options.receiveTimeout = AppEndpoint.receiveTimeout;
    handler.next(options);
  }

  _responseInterceptor(Response response, ResponseInterceptorHandler handler) {
    logger.i(
        "Response ${response.requestOptions.uri}: ${response.statusCode}\nData: ${response.data}");
    handler.next(response);
  }

  _errorInterceptor(DioError dioError, ErrorInterceptorHandler handler) {
    logger
        .e("${dioError.type} - Error ${dioError.message}\nData: ${dioError.response?.data ?? ''}");
    handler.next(dioError);
  }
}
