import '../model/model.dart';

abstract class AppApi {
  Future<NetworkResponse<T>> getConfig<T>(converter);

  Future<NetworkResponse<T>> getProfile<T>(converter);

  Future<NetworkResponse<T>> postSignIn<T>(data, converter);

  Future<NetworkResponse<T>> postSignUp<T>(data, converter);
}
