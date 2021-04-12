import 'package:get/get.dart';
import 'package:werewolf_client/app/resources/resources.dart';
import 'package:werewolf_client/app/ui/base/base_controller.dart';
import 'package:werewolf_client/app/utils/utils.dart';

class RoomController extends BaseController with SocketListener {
  SocketService service;

  @override
  void onInit() async {
    super.onInit();
    service = await SocketService.instance();
    easyLoading(true);
    service.registerListener(type: SocketListenType.room, listener: this);
  }

  @override
  void onSocketInfoRoom(data) async {
    super.onSocketInfoRoom(data);
    if (GetPlatform.isIOS) data = AppConverter.parseSocketData(data);
    await service.emitReady();
    easyLoading(false);
  }

  @override
  void dispose() {
    service.unListener(SocketListenType.room);
    super.dispose();
  }
}
