import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthScreen extends StatefulWidget {
  const GoogleAuthScreen({super.key});

  @override
  State<GoogleAuthScreen> createState() => _GoogleAuthScreenState();
}

class _GoogleAuthScreenState extends State<GoogleAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              signInWithGoogle();
            },
            child: Text("Google signin")),
      ),
    );
  }

  signInWithGoogle() async {
    //1. create instance of auth
    var auth = FirebaseAuth.instance;
    // auth.signInW
    //2. get available google accounts on device
    var account = await GoogleSignIn().signIn();
    //3. select one to authorize your account
    //4. auth your google account
    var authorize = await account?.authentication;
    var credential = GoogleAuthProvider.credential(
        accessToken: authorize?.accessToken, idToken: authorize?.idToken);

    //5. login with credential
    var user = await auth.signInWithCredential(credential);
    if (user.user != null) {
      // auth completed
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Google auth seccessful")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Google auth not seccessful")));

      // not authorized yet
    }
  }
}
