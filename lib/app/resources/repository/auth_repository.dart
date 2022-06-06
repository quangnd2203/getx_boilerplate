import 'package:dio/dio.dart';
import '../../constants/constants.dart';
import '../../utils/app_clients.dart';
import '../resources.dart';

class AuthRepository {

  factory AuthRepository() {
    _instance ??= AuthRepository._();
    return _instance!;
  }
  AuthRepository._();

  static AuthRepository? _instance;

// /Example
  Future<NetworkState<List<TestModel>>> testApi() async {
    final bool isDisconnect = await WifiService.isDisconnect();
    if (isDisconnect) {
      return NetworkState<List<TestModel>>.withDisconnect();
    }
    try {
      const String api = AppEndpoint.TEST_API;
      // Map<String, dynamic> params = {
      //   "os": Platform.isAndroid ? "android" : "ios"
      // };
      final Response<List<Map<String, dynamic>>> response = await AppClients().get(api);
      return NetworkState<List<TestModel>>(
        status: AppEndpoint.SUCCESS,
        data: response.data?.map((Map<String, dynamic> e) => TestModel.fromJson(e)).toList(),
      );
    } on DioError catch (e) {
      return NetworkState<List<TestModel>>.withError(e);
    }
  }
}
