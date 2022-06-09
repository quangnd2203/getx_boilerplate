// ignore_for_file: avoid_dynamic_calls, always_specify_types, strict_raw_type
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:logger/logger.dart';
import '../constants/constants.dart';
import 'utils.dart';

class AppClients extends DioForNative {

  factory AppClients({BaseOptions? options}) {
    _instance ??= AppClients._(baseUrl: AppEnvironment.getBaseUrlByEnvironment());
    if (options != null){
      _instance!.options = options;
    }
    _instance!.options.baseUrl = AppEnvironment.getBaseUrlByEnvironment();
    return _instance!;
  }

  AppClients._({required String baseUrl, BaseOptions? options}) : super(options) {
    interceptors.add(InterceptorsWrapper(
          onRequest: _requestInterceptor,
          onResponse: _responseInterceptor,
          onError: _errorInterceptor,
        ));
    this.options.baseUrl = baseUrl;
    this.options.headers = AppEnvironment.getBaseHeader();
  }
  static const String GET = 'GET';
  static const String POST = 'POST';
  static const String PUT = 'PUT';
  static const String DELETE = 'DELETE';

  static AppClients? _instance;
  static Logger logger = Logger();

  Future<void> _requestInterceptor(RequestOptions options, RequestInterceptorHandler handler) async {
    final String? accessToken = AppPrefs.accessToken;

    switch (options.method) {
      case AppClients.GET:
        //Remove if contains
        if (options.queryParameters.containsKey('accessToken'))
          options.queryParameters.remove('accessToken');
        //Add again
        options.queryParameters.addAll({
          'accessToken': accessToken,
        });
        logger.i('${options.method}: ${options.uri}\nParams: ${options.queryParameters}');
        break;

      default:
        if (options.data is Map<String, dynamic>) {
          final Map<String, dynamic> data = options.data as Map<String, dynamic>;
          //Remove if contains
          if (data.containsKey('accessToken')){
            options.data.remove('accessToken');
          }
          //Add again
          options.data.addAll({'accessToken': accessToken});
          logger.i('${options.method}: ${options.uri}\nParams: ${options.data}');
        } else if (options.data is FormData) {
          options.data.fields.addAll([MapEntry('accessToken', accessToken),],);
          logger.i('${options.method}: ${options.uri}\nParams: ${options.data.fields}');
        }
        break;
    }
    options.connectTimeout = AppEndpoint.connectionTimeout;
    options.receiveTimeout = AppEndpoint.receiveTimeout;
    handler.next(options);
  }

  void _responseInterceptor(Response response, ResponseInterceptorHandler handler) {
    logger.i(
        'Response ${response.requestOptions.uri}: ${response.statusCode}\nData: ${response.data}');
    handler.next(response);
  }

  void _errorInterceptor(DioError dioError, ErrorInterceptorHandler handler) {
    logger
        .e("${dioError.type} - Error ${dioError.message}\nData: ${dioError.response?.data ?? ''}");
    handler.next(dioError);
  }
}
