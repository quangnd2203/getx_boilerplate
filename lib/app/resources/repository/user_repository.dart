import '../provider/api_imp.dart';
import '../model/model.dart';
import '../provider/api.dart';

class UserRepository {
  UserRepository._(this._api);

  static UserRepository _instance;

  factory UserRepository({AppApi api}) {
    if (_instance == null)
      _instance = UserRepository._(api ?? AppApiImp());
    else if (api != null) _instance._api = api;
    return _instance;
  }

  AppApiImp _api;

  Future<NetworkResponse<UserModel>> getProfile() async {
    return await _api.getProfile((data) => UserModel.fromJson(data));
  }
}
