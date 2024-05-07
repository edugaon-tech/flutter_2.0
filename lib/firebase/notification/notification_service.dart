import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final _messaging = FirebaseMessaging.instance;

  showLocalNotification(RemoteMessage message) async {
    var notificationPlugin = FlutterLocalNotificationsPlugin();
    await notificationPlugin.initialize(const InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/ic_launcher"),
        iOS: DarwinInitializationSettings()));

    var notificationDetails = const NotificationDetails(
        android: AndroidNotificationDetails("channelId", "channelName",
            importance: Importance.max, priority: Priority.high));

    notificationPlugin.show(
        message.hashCode, "${message.notification?.title}", "${message.notification?.body}", notificationDetails);
  }

  // when app is open
  onForegroundNotification() {
    FirebaseMessaging.onMessage.listen((event) {
      showLocalNotification(event);
    });
  }

  whenAppOpen()async{
   var message =  await _messaging.getInitialMessage();
   showLocalNotification(message!);
  }

  Future<String?>getFCMToken()async{
    var token = await _messaging.getToken();
    print("Token: $token");
    return token;
  }

}

Future<void> onBackGroundNotification(RemoteMessage message)async{
  NotificationService().showLocalNotification(message);
}
