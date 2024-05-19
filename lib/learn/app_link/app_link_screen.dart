import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import '../../firebase/dynamic_link/dynamic_link_screen.dart';
import '../../firebase_options.dart';

void main() async {
  runApp(YourApp());
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initDynamicLinks();
}



void initDynamicLinks() async {
  FirebaseDynamicLinks.instance.onLink.listen((event) {
    final Uri deepLink = event.link;
    Fluttertoast.showToast(msg: event.link.queryParameters.toString());
    print(deepLink);

    if (deepLink != null) {

      // Handle the deep link. For example, open the specific page.
      // Navigator.pushNamed(context, deepLink.path);
    }
  });

  final PendingDynamicLinkData? data =
  await FirebaseDynamicLinks.instance.getInitialLink();
  var deepLink = data?.link.path;
  Fluttertoast.showToast(msg: deepLink.toString());
  if (deepLink != null) {
    // Handle the deep link. For example, open the specific page.
    // Navigator.pushNamed(context, deepLink.path);
  }
}

class YourApp extends StatelessWidget {
  YourApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routers,
      theme: ThemeData(useMaterial3: false),
    );
  }

  var routers = GoRouter(routes: [
    GoRoute(
        path: "/",
        builder: (_, __) => DynamicLinkScreen()),
    GoRoute(
        path: "/profile",
        builder: (_, __) => Scaffold(
              appBar: AppBar(
                title: const Text("Profile"),
              ),
            )),
    GoRoute(
        path: "/settings",
        builder: (_, __) => Scaffold(
              appBar: AppBar(
                title: const Text("Settings"),
              ),
            )),
    GoRoute(
        path: "/edit_profile",
        builder: (_, __) => Scaffold(
              appBar: AppBar(
                title: const Text("Update Profile"),
              ),
            )),
  ]);
}
