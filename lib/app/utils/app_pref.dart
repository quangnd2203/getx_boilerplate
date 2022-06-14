// ignore_for_file: always_specify_types, strict_raw_type

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppPrefs {
  AppPrefs._();

  static final GetStorage _box = GetStorage('AppPref');

  static final GetStream<dynamic> _userBehavior = GetStream<dynamic>();

  static Future<void> initListener() async {
    await GetStorage.init('AppPref');
    _box.listenKey('user', (user) {
      _userBehavior.add(user);
    });
  }

  static set appMode(String? data) => _box.write('appMode', data);

  static String? get appMode => _box.read('appMode');

  static set accessToken(String? data) => _box.write('accessToken', data);

  static String? get accessToken => _box.read('accessToken');

  // static set user(Apps? _user) {
  //   _box.write('user', _user);
  // }
  //
  // static Apps? get user {
  //   final _ = _box.read('user');
  //   if (_ == null) return null;
  //   return _ is Apps ? _ : Apps.fromJson(_box.read('user'));
  // }

  static Stream get watchUser => _userBehavior.stream;
}
