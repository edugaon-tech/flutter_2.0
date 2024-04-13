import 'package:flutter/material.dart';

import 'auth_widgets.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var view = AuthWidgets();
    return Scaffold(
      appBar: view.authAppBarView("Login"),
      body: Column(
        children: [
          view.authTextFieldView(emailController),
          view.authTextFieldView(passwordController),
          view.authButtonView("Login",context,onTab: (){

          })
        ],
      ),
    );
  }
}
