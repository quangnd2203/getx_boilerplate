// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import '../../constants/app_endpoint.dart';

typedef NetworkStateConverter<T> = T Function(dynamic json);

class NetworkState<T> {
  NetworkState({this.message, this.data, this.status});

  factory NetworkState.fromResponse(Response<dynamic> response, {NetworkStateConverter<T>? converter, T? value, String? prefix}) {
    try {
      final Map<String, dynamic> json = jsonDecode(jsonEncode(response.data)) as Map<String, dynamic>;
      return NetworkState<T>._fromJson(
        json,
        converter: converter,
        prefix: prefix,
        value: value,
      );
    } catch (e) {
      log('Error NetworkResponse.fromResponse: $e');
      return NetworkState<T>.withErrorConvert();
    }
  }

  NetworkState._fromJson(Map<String, dynamic> json, {NetworkStateConverter<T>? converter, T? value, String? prefix}) {
    status = json['status'] as int?;
    message = json['message'] as String?;
    if (value != null)
      data = value;
    else if (prefix != null) {
      if (prefix.trim().isEmpty){
        data = converter != null && json != null ? converter(json) : json as T?;
      } else{
        data = converter != null && json[prefix] != null ? converter(json[prefix] as Map<String, dynamic>) : json[prefix] as T?;
      }
    } else {
      data = converter != null && json['data'] != null ? converter(json['data']) : json['data'] as T?;
    }
  }

  NetworkState.fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    status = json['status'] as int ?;
    data = json['data'] as T;
  }

  NetworkState.withError(DioError error) {
    String message;
    int? code;
    final Response<T>? response = error.response as Response<T>?;
    if (response != null) {
      code = response.statusCode;
      message = (response.data! as Map<String, dynamic>)['message'] as String;
    } else {
      code = AppEndpoint.ERROR_SERVER;
      message = 'Không thể kết nối đến máy chủ!';
    }
    this.message = message;
    status = code;
    data = null;
  }

  NetworkState.withDisconnect() {
    message = 'Mất kết nối internet, vui lòng kiểm tra wifi/3g và thử lại!';
    status = AppEndpoint.ERROR_DISCONNECT;
    data = null;
  }

  NetworkState.withErrorConvert() {
    data = null;
  }

  int? status;
  String? message;
  T? data;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    data['data'] = this.data;
    return data;
  }

  bool get isSuccess => status == AppEndpoint.SUCCESS;

  bool get isError => status != AppEndpoint.SUCCESS;
}
