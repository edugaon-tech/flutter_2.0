import 'package:flutter/material.dart';
import 'package:flutter_learn_bipul/views/auth/auth_widgets.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
  TextEditingController nameController = TextEditingController();
   TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var view = AuthWidgets();
    return Scaffold(
      appBar: view.authAppBarView("Registration"),
      body: Column(
        children: [
          view.authTextFieldView(nameController),
          view.authTextFieldView(phoneController),
          view.authTextFieldView(emailController),
          view.authTextFieldView(passwordController),
          view.spaceView(
            height: 30
          ),
          view.authButtonView("Register",context,onTab: (){

          })
        ],
      ),
    );
  }
}
