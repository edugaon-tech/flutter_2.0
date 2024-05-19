import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

class DynamicLinkService {


  Future<Uri?> createDynamicLink(String path) async {

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: "https://flutterlearnbipul.page.link/app",
      link: Uri.parse('http://edugaon.com/'),
      androidParameters: const AndroidParameters(
        packageName: 'com.example.flutter_learn_bipul',
        minimumVersion: 1,
      ),
      iosParameters: const IOSParameters(
        bundleId: 'com.example.flutter_learn_bipul',
        minimumVersion: '1.0.0',
      ),
    );

    final Uri dynamicLink = await FirebaseDynamicLinks.instance.buildLink(parameters);
    return dynamicLink;
  }

  Future<void> handleDynamicLink(BuildContext context) async {
    final PendingDynamicLinkData? data = await FirebaseDynamicLinks.instance.getInitialLink();
    if (data?.link != null) {
      // Handle the dynamic link
       Uri? deepLink = data?.link;
      // Navigate to the appropriate screen based on the deep link
    }else{

    }

    FirebaseDynamicLinks.instance.onLink.listen((event) {
      event.link;
    });
  }
}