
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService{
  // var _message = FirebaseMessaging.instance;

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

  onForegroundMessageHandler(){
    FirebaseMessaging.onMessage.listen((event) {
      showLocalNotification(event);
    });
  }

  Future<String?>getFCMToken()async{
    var token = await FirebaseMessaging.instance.getToken();
    print(token);
    return token;
  }
}