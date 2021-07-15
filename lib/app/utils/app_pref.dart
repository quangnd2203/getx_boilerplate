import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../resources/resources.dart';

class AppPref {
  AppPref._();

  static late Box _box;

  static initListener() async {
    if (!kIsWeb) {
      Directory appDocDirectory = await getApplicationDocumentsDirectory();
      Hive..init(appDocDirectory.path);
    }
    _box = await Hive.openBox('AppPref');
  }

  static set accessToken(String? token) => _box.put('accessToken', token);

  static String? get accessToken => _box.get('accessToken');

  static set themeModel(String? theme) => _box.put('themeModel', theme);

  static String? get themeModel => _box.get('themeModel');

  static set user(UserModel? data) {
    if (data == null)
      _box.put('user', '');
    else
      _box.put('user', jsonEncode(data.toJson()));
  }

  static UserModel? get user {
    final data = _box.get('user');
    if (data == null || data?.isEmpty) return null;
    return UserModel.fromJson(jsonDecode(data));
  }

  static Stream<BoxEvent> get userWatch => _box.watch(key: 'user');
}
