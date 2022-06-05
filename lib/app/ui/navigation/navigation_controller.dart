import 'dart:async';

import 'package:flutter_app/app/resources/model/model.dart';
import 'package:flutter_app/app/resources/repository/auth_repository.dart';
import 'package:get/get.dart';

import '../ui.dart';

class NavigationController extends BaseController {

  var raw = <TestModel>[].obs;

  var count = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      count.value ++;
      count.refresh();
    });
    await fetchTestApi();
  }

  Future fetchTestApi() async {
    final _ = await AuthRepository().testApi();
    if(_.isSuccess){
      raw.assignAll(_.data);
    }
  }
}
