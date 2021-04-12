import 'package:socket_io_client/socket_io_client.dart';
import 'package:werewolf_client/app/constants/constants.dart';
import 'package:werewolf_client/app/resources/service/socket/socket_constant.dart';
import 'package:werewolf_client/app/utils/app_pref.dart';

import 'socket_listener.dart';

enum SocketListenType { room }

enum ResultInviteType { accept, reject }

class SocketService {
  SocketService._();

  static SocketService _socketService;
  Socket _socketIO;
  SocketListener _listener;

  static Future<SocketService> instance([listener]) async {
    if (_socketService == null) {
      _socketService = SocketService._();
      await _socketService.initSocket(listener);
    }
    return _socketService;
  }

  initSocket([listener]) async {
    String uri = AppEndpoint.BASE_URL_SOCKET;
    _socketIO = io(
        uri,
        OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .setQuery({'accessToken': AppPref.accessToken})
            .build());
    _setListener(listener ?? SocketListener());
    _socketIO.onConnect(_listener.onSocketConnect);
    _socketIO.onDisconnect(_listener.onSocketDisconnect);
    _socketIO.connect();
  }

  void destroy() {
    if (_socketIO != null) _socketIO.disconnect();
    _socketService = null;
    _listener = null;
  }

  String get id => _socketIO.id;

  bool get isConnected => _socketIO.connected;

  SocketListener get listener => _listener;

  _setListener(SocketListener value) {
    _listener = value ?? SocketListener();
  }

  emitChangeLanguageCode(String code) {
    print("==========> EMIT CHANGE LANGUAGE");
    _socketIO.emit("changeLanguageCode", [
      {'languageCode': code}
    ]);
  }

  emitFindRoom() {
    print("==========> EMIT FIND ROOM");
    _socketIO.emit(SocketConstant.emitFindRoom, [
      {'type': 'normal'}
    ]);
  }

  emitReady() {
    print("==========> EMIT READY");
    _socketIO.emit(SocketConstant.emitReadyPlayer, []);
  }

  registerListener({SocketListenType type, SocketListener listener}) {
    _setListener(listener);
    switch (type) {
      case SocketListenType.room:
        _socketIO.on(SocketConstant.onInfoRoom, _listener.onSocketInfoRoom);
        _socketIO.on(SocketConstant.onReadyRoom, _listener.onSocketReadyRoom);
        _socketIO.on(SocketConstant.onRolePlayer, _listener.onSocketRolePlayer);
        _socketIO.on(
            SocketConstant.onMessageRoom, _listener.onSocketMessageRoom);
        _socketIO.on(
            SocketConstant.onMessageWolf, _listener.onSocketMessageWolf);
        _socketIO.on(SocketConstant.onMessageDie, _listener.onSocketMessageDie);
        break;
      default:
        break;
    }
  }

  unListener(SocketListenType type) async {
    switch (type) {
      case SocketListenType.room:
        _socketIO.off(SocketConstant.onInfoRoom, _listener.onSocketInfoRoom);
        _socketIO.off(SocketConstant.onReadyRoom, _listener.onSocketReadyRoom);
        _socketIO.off(
            SocketConstant.onRolePlayer, _listener.onSocketRolePlayer);
        _socketIO.off(
            SocketConstant.onMessageRoom, _listener.onSocketMessageRoom);
        _socketIO.off(
            SocketConstant.onMessageWolf, _listener.onSocketMessageWolf);
        _socketIO.off(
            SocketConstant.onMessageDie, _listener.onSocketMessageDie);
        break;
      default:
        break;
    }
  }
}
