export 'firebase_messaging.dart';
export 'local_notification.dart';
export 'notification_data.dart';

import 'dart:async';
import 'dart:convert';

import 'package:rxdart/rxdart.dart';

import 'notification_data.dart';

final BehaviorSubject<String> selectNotificationSubject =
    BehaviorSubject<String>();

StreamSubscription _subscription;

configureSelectNotificationSubject(Function(Data payload) redirect) {
  _subscription =
      selectNotificationSubject.stream.listen((String _payload) async {
    if (_payload == null) return;
    try {
      Data payload = Data.fromJson(jsonDecode(_payload));
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
