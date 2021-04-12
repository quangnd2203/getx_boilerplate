import 'package:dio/dio.dart';

import '../../constants/constants.dart';
import 'api.dart';
import '../model/model.dart';
import '../service/wifi_service.dart';
import 'client.dart';

class AppApiImp extends AppApi {
  @override
  Future<NetworkResponse<ConfigModel>> getConfig<ConfigModel>(converter) async {
    bool isDisconnect = await WifiService.isDisconnect();
    if (isDisconnect) return NetworkResponse.withDisconnect();
    try {
      Response response = await AppClients().get(AppEndpoint.GET_CONFIG);
      return NetworkResponse.fromResponse(response, converter: converter);
    } on DioError catch (e) {
      return NetworkResponse.withErrorRequest(e);
    }
  }

  @override
  Future<NetworkResponse<T>> getProfile<T>(converter) async {
    bool isDisconnect = await WifiService.isDisconnect();
    if (isDisconnect) return NetworkResponse.withDisconnect();
    try {
      Response response = await AppClients().get(AppEndpoint.GET_PROFILE);
      return NetworkResponse.fromResponse(response, converter: converter);
    } on DioError catch (e) {
      return NetworkResponse.withErrorRequest(e);
    }
  }

  @override
  Future<NetworkResponse<T>> postSignIn<T>(data, converter) async {
    bool isDisconnect = await WifiService.isDisconnect();
    if (isDisconnect) return NetworkResponse.withDisconnect();
    try {
      Response response = await AppClients().post(AppEndpoint.POST_SIGN_IN,
          data: data);
      return NetworkResponse.fromResponse(response, converter: converter);
    } on DioError catch (e) {
      return NetworkResponse.withErrorRequest(e);
    }
  }

  @override
  Future<NetworkResponse<T>> postSignUp<T>(data, converter) async {
    bool isDisconnect = await WifiService.isDisconnect();
    if (isDisconnect) return NetworkResponse.withDisconnect();
    try {
      Response response =
          await AppClients().post(AppEndpoint.POST_SIGN_UP, data: data);
      return NetworkResponse.fromResponse(response, converter: converter);
    } on DioError catch (e) {
      return NetworkResponse.withErrorRequest(e);
    }
  }
}
