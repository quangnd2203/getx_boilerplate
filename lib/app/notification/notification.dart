export 'firebase_messaging.dart';
export 'local_notification.dart';
export 'notification_data.dart';

import 'dart:async';
import 'dart:convert';

import 'package:rxdart/rxdart.dart';

import 'firebase_messaging.dart';
import 'local_notification.dart';
import 'notification_data.dart';

notificationInitialed() {
  FirebaseCloudMessaging.initFirebaseMessaging();
  LocalNotification.setup();
}

final BehaviorSubject<String?> selectNotificationSubject = BehaviorSubject<String?>();

StreamSubscription? _subscription;

configureSelectNotificationSubject(Function(FCMData payload) redirect) {
  _subscription = selectNotificationSubject.stream.listen((String? _payload) async {
    if (_payload == null) return;
    try {
      FCMData payload = FCMData.fromJson(jsonDecode(_payload));
      redirect(payload);
    } catch (e) {
      print('Error redirect by notification: $e');
    } finally {
      selectNotificationSubject.add(null);
    }
  });
}

unConfigureSelectNotificationSubject() {
  _subscription?.cancel();
  _subscription = null;
}
