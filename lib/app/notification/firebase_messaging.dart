import 'dart:developer';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'notification.dart';

//This method will be call in background where have a new message
Future<void> backgroundMessageHandler(RemoteMessage message) async {
  //Do not thing...
  // return FirebaseCloudMessaging._handler(message);
}

class FirebaseCloudMessaging {
  FirebaseCloudMessaging._();

  static final FirebaseMessaging instance = FirebaseMessaging.instance;

  static Future<void> initFirebaseMessaging() async {
    if (Platform.isIOS) {
      await instance.requestPermission();
    }
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('OnMessage: ${message.data}');
      _handler(message, show: true);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('OnMessageOpenedApp: ${message.data}');
      _handler(message, show: true);
    });
    FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
    final RemoteMessage? initMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initMessage != null) {
      _handler(initMessage);
    }
  }

  static void _handler(RemoteMessage message, {bool show = false}) {
    final Data payload = Data.fromJson(message.data);
    if (show) {
      LocalNotification.showNotification(message.notification?.title,
          message.notification?.body, payload.toString());
      notificationSubject.add(true);
    } else {
      selectNotificationSubject.add(payload.toString());
    }
  }

}
