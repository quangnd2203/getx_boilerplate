import 'package:flutter/foundation.dart';

import '../provider/api_imp.dart';
import '../model/model.dart';
import '../provider/api.dart';
import '../resources.dart';

enum SignInType { normal, google, facebook }

class AuthRepository {
  AuthRepository._(this._api);

  static AuthRepository _instance;

  factory AuthRepository({AppApi api}) {
    if (_instance == null)
      _instance = AuthRepository._(api ?? AppApiImp());
    else if (api != null) _instance._api = api;
    return _instance;
  }

  AppApiImp _api;

  Future<NetworkResponse<SignInResponseModel>> postSignIn(
      {String username,
      String password,
      SignInType type,
      LoginSocialResult result}) async {
    Map<String, dynamic> params;
    switch (type) {
      case SignInType.normal:
        params = {
          'username': username,
          'password': password,
          'type': describeEnum(type)
        };
        break;
      case SignInType.google:
        params = {'type': describeEnum(type)};
        break;
      case SignInType.facebook:
        params = {'type': describeEnum(type)};
        break;
      default:
        break;
    }

    return await _api.postSignIn(
        params, (data) => SignInResponseModel.fromJson(data));
  }

  Future<NetworkResponse<SignInResponseModel>> postSignUp(
      {String username, String password, String email}) async {
    return await _api.postSignUp(
        {'username': username, 'password': password, 'email': email},
        (data) => SignInResponseModel.fromJson(data));
  }
}
