import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class DynamicLinkScreen extends StatefulWidget {
  const DynamicLinkScreen({super.key});

  @override
  State<DynamicLinkScreen> createState() => _DynamicLinkScreenState();
}

class _DynamicLinkScreenState extends State<DynamicLinkScreen> {
  @override
  void initState() {
    // initDynamicLinks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic Link"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                // createDynamicLink("126sk");
                generateDynamicLink();
              },
              child: Text("Send Link"))
        ],
      ),
    );
  }

  generateDynamicLink() async {
    var parameters = DynamicLinkParameters(
        link: Uri.parse("https://flutterlearnbipul.com?product=Shoes"),
        uriPrefix: "https://flutterlearnbipul.page.link",
        socialMetaTagParameters: SocialMetaTagParameters(
            description: "nothing but everything",
            imageUrl: Uri.parse(
                "https://www.gstatic.com/mobilesdk/240501_mobilesdk/firebase_28dp.png"),
            title: "Test Sharing"),
        iosParameters: const IOSParameters(
          bundleId: '',
        ),
        androidParameters: const AndroidParameters(
            packageName: "com.example.flutter_learn_bipul", minimumVersion: 1));

    var link = await FirebaseDynamicLinks.instance.buildShortLink(parameters);
    Share.share(link.shortUrl.toString());
  }
}

