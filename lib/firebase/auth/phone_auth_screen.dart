import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  var otpController = TextEditingController();
  var firebaseAuth = FirebaseAuth.instance;

  String verificationId = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  //
                  firebaseAuth.verifyPhoneNumber(
                      phoneNumber: "+91 9142770737",
                      // called whe  verification completed
                      verificationCompleted: (PhoneAuthCredential credential) {
                        print(credential);
                      },
                      // when any error accords
                      verificationFailed: (FirebaseAuthException error) {
                        print(error);
                      },
                      // when code sent by server
                      codeSent: (String id, int? resendToken) {
                        setState(() {
                          verificationId = id;
                        });
                      },
                      // when code receiving time out
                      codeAutoRetrievalTimeout: (timer) {
                        print(timer);
                      });
                },
                child: Text("Verify Phone")),
            TextFormField(
              controller: otpController,
            ),
            ElevatedButton(
                onPressed: () async {
                  var credential = PhoneAuthProvider.credential(
                      verificationId: verificationId,
                      smsCode: otpController.text);
                  UserCredential user =
                      await firebaseAuth.signInWithCredential(credential);

                  if (user.user != null) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Successful")));
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Successful")));
                  }
                },
                child: Text("Verify OTP")),
          ],
        ),
      ),
    );
  }
}
