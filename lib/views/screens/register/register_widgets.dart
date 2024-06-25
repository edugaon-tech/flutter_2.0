import 'package:flutter/material.dart';
import 'package:flutter_learn_bipul/views/utils/app_widgets/app_text_fields.dart';
import 'package:flutter_learn_bipul/views/utils/styles/button_styles.dart';

class RegisterWidgets {
  BuildContext context;

  RegisterWidgets({required this.context});

  Widget registerTextFieldView(
      TextEditingController controller, String hintText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppTextFields().authTextFields(controller),
    );
  }

  Widget registerButtonView({required void Function()? onPressed}) {
    return ElevatedButton(
      style: AppButtonStyles().appButton(),
        onPressed: onPressed, child: Text("Register"));
  }
}
