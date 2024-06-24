import 'package:flutter/material.dart';
import 'package:flutter_learn_bipul/views/screens/register/register_widgets.dart';
import 'package:flutter_learn_bipul/views/utils/sizes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    var view = RegisterWidgets(context: context);
    return Scaffold(
      appBar: AppBar(title: Text("Register"),),
      body: Column(
       children: [
         view.registerTextFieldView(TextEditingController(), "Enter Name"),
         view.registerTextFieldView(TextEditingController(), "Enter Email"),
         view.registerTextFieldView(TextEditingController(), "Enter Password"),

         SizedBox(height: AppSizes(context: context).getHeight/20,),
         view.registerButtonView(onPressed: (){})
       ],
      ),
    );
  }
}
