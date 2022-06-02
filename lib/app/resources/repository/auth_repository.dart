import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../constants/constants.dart';
import '../../utils/app_clients.dart';
import '../resources.dart';

class AuthRepository {
  AuthRepository._();

  static AuthRepository? _instance;

  factory AuthRepository() {
    if (_instance == null) _instance = AuthRepository._();
    return _instance!;
  }

// /Example
  Future<NetworkState> testApi() async {
    bool isDisconnect = await WifiService.isDisconnect();
    if (isDisconnect) return NetworkState.withDisconnect();
    try {
      String api = AppEndpoint.TEST_API;
      // Map<String, dynamic> params = {
      //   "os": Platform.isAndroid ? "android" : "ios"
      // };
      Response response = await AppClients().get(api);
      return NetworkState(
        status: AppEndpoint.SUCCESS,
        data: (response.data as List<dynamic>).map((e) => TestModel.fromJson(e)).toList(),
      );
    } on DioError catch (e) {
      return NetworkState.withError(e);
    }
  }
}
