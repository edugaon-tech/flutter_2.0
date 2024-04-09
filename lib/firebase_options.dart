// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCLz6kQNIbytD4ITzAIOOxDcFGqgxxrTBw',
    appId: '1:239775755533:web:27e45263209db423ea1444',
    messagingSenderId: '239775755533',
    projectId: 'edugaon-tech',
    authDomain: 'edugaon-tech.firebaseapp.com',
    databaseURL: 'https://edugaon-tech-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'edugaon-tech.appspot.com',
    measurementId: 'G-MH41LJJJ1B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCl-T9JdeTD-wm9ZWDnavF9iOthOBiXbHQ',
    appId: '1:239775755533:android:a9d6414a5a61bcd7ea1444',
    messagingSenderId: '239775755533',
    projectId: 'edugaon-tech',
    databaseURL: 'https://edugaon-tech-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'edugaon-tech.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBHnTaB4xowx_c-XFoaMdbLg0A4xTujGbU',
    appId: '1:239775755533:ios:751320a2d6134b0aea1444',
    messagingSenderId: '239775755533',
    projectId: 'edugaon-tech',
    databaseURL: 'https://edugaon-tech-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'edugaon-tech.appspot.com',
    iosBundleId: 'com.example.flutterLearnBipul',
  );
}
