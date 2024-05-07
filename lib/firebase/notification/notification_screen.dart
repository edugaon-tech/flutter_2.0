import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showLocalNotification();
          },
          child: Text("Show Notification"),
        ),
      ),
    );
  }

  showLocalNotification() async {
    var notificationPlugin = FlutterLocalNotificationsPlugin();

    // 1. initialize the plugin
     await notificationPlugin.initialize(const InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
       iOS: DarwinInitializationSettings(
         defaultPresentAlert: true,

       )
    ));

    notificationPlugin.show(
        "".hashCode, "Vinay kumar", "Kya haal h pramod", const NotificationDetails(
      android: AndroidNotificationDetails("channelId", "channelName",importance: Importance.high )

    ));
  }
}
