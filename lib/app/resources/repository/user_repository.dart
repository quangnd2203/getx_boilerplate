import '../provider/api_imp.dart';
import '../model/model.dart';
import '../provider/api.dart';
import '../../utils/utils.dart';

class UserRepository {
  UserRepository._(this._api);

  static UserRepository? _instance;

  factory UserRepository({AppApi? api}) {
    if (_instance == null)
      _instance = UserRepository._(api ?? AppApiImp());
    else if (api != null) _instance!._api = api;
    return _instance!;
  }

  AppApi _api;

  Future<UserModel?> getProfile() async {
    NetworkResponse<UserModel> response = await _api.getProfile((data) => UserModel.fromJson(data));
    if (response.isSuccess) AppPref.user = response.data;
    return response.data;
  }
}
