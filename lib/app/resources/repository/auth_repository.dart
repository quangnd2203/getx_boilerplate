import 'package:flutter/foundation.dart';

import '../provider/api_imp.dart';
import '../model/model.dart';
import '../provider/api.dart';
import '../resources.dart';

enum SignInType { normal, google, facebook }

class AuthRepository {
  AuthRepository._(this._api);

  static AuthRepository? _instance;

  factory AuthRepository({AppApi? api}) {
    if (_instance == null)
      _instance = AuthRepository._((api ?? AppApiImp()));
    else if (api != null) _instance!._api = api;
    return _instance!;
  }

  AppApi _api;

// Future<NetworkResponse<SignInResponseModel>> postSignIn(
//     {required String username,
//     required String password,
//     required SignInType type,
//     required LoginSocialResult result}) async {
//   Map<String, dynamic> params;
//   switch (type) {
//     case SignInType.normal:
//       params = {
//         'username': username,
//         'password': password,
//         'type': describeEnum(type)
//       };
//       break;
//     case SignInType.google:
//       params = {'type': describeEnum(type)};
//       break;
//     case SignInType.facebook:
//       params = {'type': describeEnum(type)};
//       break;
//     default:
//       break;
//   }
//
//   return await _api.postSignIn(
//       params, (data) => SignInResponseModel.fromJson(data));
// }
}
