import 'package:flutter_app/app/resources/model/model.dart';
import 'package:flutter_app/app/resources/repository/auth_repository.dart';
import 'package:get/get.dart';

import '../ui.dart';

class NavigationController extends BaseController {

  RxList<TestModel> raw = <TestModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    setLoading(true);
    await fetchTestApi();
    setLoading(false);
  }

  Future fetchTestApi() async {
    final _ = await AuthRepository().testApi();
    if(_.isSuccess) raw.value = _.data;
  }
}
