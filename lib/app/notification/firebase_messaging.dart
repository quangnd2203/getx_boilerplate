import 'dart:developer';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'local_notification.dart';
import 'notification.dart';
import 'notification_data.dart';

Future<void> backgroundMessageHandler(RemoteMessage message) async {
  log("OnBackgroundMessage: $message");
  return FirebaseCloudMessaging._handler(message);
}

class FirebaseCloudMessaging {
  static final FirebaseMessaging instance = FirebaseMessaging.instance;

  static initFirebaseMessaging() async {
    if (Platform.isIOS) {
      instance.requestPermission();
    }
    FirebaseMessaging.onMessage.listen((message) {
      log("OnMessage: $message");
      _handler(message, onlyShow: true);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      log("OnMessageOpenedApp: $message");
      _handler(message);
    });
    FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
  }

  static _handler(RemoteMessage message, {bool onlyShow = false}) {
    Data payload = Data.fromJson(message.data);
    if (onlyShow) {
      LocalNotification.showNotification(message.notification.title,
          message.notification.body, payload.toString());
    } else {
      selectNotificationSubject.add(payload.toString());
    }
  }
}
