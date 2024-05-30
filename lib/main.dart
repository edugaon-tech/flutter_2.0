import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_bipul/firebase/notification/notification_service.dart';
import 'package:flutter_learn_bipul/firebase_options.dart';
import 'package:flutter_learn_bipul/second_screen.dart';
import 'package:flutter_learn_bipul/users/user_provider.dart';
import 'package:provider/provider.dart';
import 'firebase/dynamic_link/dynamic_link_screen.dart';
import 'firebase/notification/notification_screen.dart';
import 'learn/app_link/app_link_screen.dart';

@pragma('vm:entry-point')
Future<void> onBackGroundMessageHandler(RemoteMessage message) async {
  NotificationService().showLocalNotification(message);
  print("title:${message.notification?.title}");
  print("body:${message.notification?.body}");
}

void main() async {
  // binding you widgets with package's widgets
  WidgetsFlutterBinding.ensureInitialized();
  // to initialize firebase in the entire app
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initDynamicLinks();
  // FirebaseMessaging.onBackgroundMessage((message) => null);


  // FirebaseMessaging.onBackgroundMessage(onBackGroundMessageHandler);
  // NotificationService().getFCMToken();

  // FirebaseMessaging.onBackgroundMessage(onBackGroundNotification);
  //
  // NotificationService().onForegroundNotification();
  // NotificationService().getFCMToken();
  // NotificationService().whenAppOpen();
  runApp(ChangeNotifierProvider(
    create: (_) => UserProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          iconTheme: IconThemeData(color: Colors.red),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.black,
            iconSize: 20,
          ),
          useMaterial3: false,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red))),
      home: DynamicLinkScreen(),
    );
  }
}

