import 'package:dio/dio.dart';
import 'package:get/get.dart' as Get;

class NetworkState<T> {
  int? status;
  String? message;
  T? response;

  NetworkState({this.message, this.response, this.status});

  NetworkState.withError(DioError error) {
    String? message;
    int? code;
    Response? response = error.response;
    if (response != null) {
      code = response.statusCode;
      message = error.message;
    } else {
      code = 500;
    }
    this.message = message ?? "";
    this.status = code;
    this.response = null;
  }

  NetworkState.withDisconnect() {
    this.message = 'disconnect'.tr;
    this.status = -1;
    this.response = null;
  }

  T? get data => response;

  bool get isSuccess => status == 200 && response != null;

  bool get isError => status != 200 || response == null;
}
