import '../provider/api_imp.dart';
import '../model/model.dart';
import '../provider/api.dart';

class ConfigRepository {
  ConfigRepository._(this._api);

  static ConfigRepository? _instance;

  factory ConfigRepository({AppApi? api}) {
    if (_instance == null)
      _instance = ConfigRepository._(api ?? AppApiImp());
    else if (api != null) _instance!._api = api;
    return _instance!;
  }

  AppApi _api;

  Future<ConfigModel?> getConfig() async {
    NetworkResponse<ConfigModel> response =
        await _api.getConfig((data) => ConfigModel.fromJson(data));
    return response.data;
  }
}
