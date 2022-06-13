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
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      count.value ++;
      count.refresh();
    });
    await fetchTestApi();
    await authenticator();
  }

  Future<void> fetchTestApi() async {
    final NetworkState<List<TestModel>> networkState = await AuthRepository().testApi();
    if(networkState.isSuccess){
      raw.assignAll(networkState.data!.toList());
      raw.refresh();
    }
  }

  Future<void> authenticator() async {
    final LoginSocialResult loginSocialResult = await SocialService().signInFacebook();
    print(loginSocialResult.fullName);
  }
}
