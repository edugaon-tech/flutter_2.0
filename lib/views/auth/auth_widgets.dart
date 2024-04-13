import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthWidgets {
  AppBar authAppBarView(String title) => AppBar(
        title: Text(title),
      );

  Widget authTextFieldView(TextEditingController? controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
      ),
    );
  }

  Widget spaceView({double width = 0,double height = 0})=>SizedBox(width:width ,height: height,);

  Widget authButtonView(String btnName, BuildContext context,{void Function()? onTab}) {
    var width = MediaQuery.sizeOf(context).width;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, fixedSize: Size(width - 24, 45)),
        onPressed: onTab,
        child: Text(btnName));
  }
}
