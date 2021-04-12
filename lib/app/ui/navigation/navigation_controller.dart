import 'package:get/get.dart';
import 'package:werewolf_client/app/resources/resources.dart';
import 'package:werewolf_client/app/routes/app_pages.dart';
import 'package:werewolf_client/app/ui/base/base_controller.dart';

class NavigationController extends BaseController with SocketListener {
  SocketService service;

  @override
  void onInit() async {
    super.onInit();
    service = await SocketService.instance(this);
  }

  playNow() async {
    service.emitFindRoom();
    Get.toNamed(Routes.ROOM);
  }

  @override
  void onSocketConnect(data) {
    super.onSocketConnect(data);
  }

  @override
  void onSocketDisconnect(data) {
    super.onSocketDisconnect(data);
    showNotification(
        keyTitle: 'disconnect_to_server', action: () => Get.back());
  }
}
