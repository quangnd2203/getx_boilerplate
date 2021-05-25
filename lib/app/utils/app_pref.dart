import 'package:get_storage/get_storage.dart';
import 'package:rxdart/rxdart.dart';
import 'package:werewolf_client/app/resources/resources.dart';

class AppPref {
  AppPref._();

  static final GetStorage _box = GetStorage('AppPref');

  static final BehaviorSubject _userBehavior = BehaviorSubject<UserModel>();

  static initListener() async{
    await GetStorage.init("AppPref");
    _box.listenKey('user', (user) {
      _userBehavior.add(user);
    });
  }

  static set accessToken(String token) => _box.write('accessToken', token);

  static String get accessToken => _box.read('accessToken');

  static set user(UserModel _user) {
    _box.write('user', _user);
  }

  static UserModel get user {
    final _ = _box.read('user');
    return _ is UserModel ? _ : UserModel.fromJson(_box.read('user'));
  }

  static Stream get watchUser => _userBehavior.stream;
}
