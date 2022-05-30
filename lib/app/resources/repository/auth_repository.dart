import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class AuthRepository{
  AuthRepository._();

  static AuthRepository? _instance;

  factory AuthRepository() {
    if (_instance == null) _instance = AuthRepository._();
    return _instance!;
  }

///Example
///http://relax365.net/hsmoreapp?os=
// Future<NetworkState<OtherApplication>> getMoreApps() async {
//   bool isDisconnect = await WifiService.isDisconnect();
//   if (isDisconnect) return NetworkState.withDisconnect();
//   try {
//     String api = AppEndpoint.MORE_APPS;
//     Map<String, dynamic> params = {
//       "os" : Platform.isAndroid ? "android" : "ios"
//     };
//     Response response = await AppClients().get(api, queryParameters: params);
//     return NetworkState(
//       status: AppEndpoint.SUCCESS,
//       data: OtherApplication.fromJson(jsonDecode(response.data)),
//     );
//   } on DioError catch (e) {
//     return NetworkState.withError(e);
//   }
// }
}