import 'dart:async';
import 'package:get/get.dart';
import '../../resources/resources.dart';
import '../ui.dart';

class NavigationController extends BaseController {

  RxList<TestModel> raw = <TestModel>[].obs;

  RxInt count = 0.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      count.value ++;
      count.refresh();
    });
    await fetchTestApi();
  }

  Future<void> fetchTestApi() async {
    final _ = await AuthRepository().testApi();
    if(_.isSuccess){
      raw.assignAll(_.data!.toList());
    }
  }
}
