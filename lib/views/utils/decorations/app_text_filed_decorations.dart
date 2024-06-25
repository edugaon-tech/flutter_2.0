
import 'package:flutter/material.dart';
import 'package:flutter_learn_bipul/views/utils/colors.dart';

class AppTextFiledDecorations{

 static OutlineInputBorder textFieldBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(width: 2.0, color: Colors.grey));
  }

 static OutlineInputBorder textFieldEnableBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: textFieldBorderColor, width: 2.0),
    );
  }

  static OutlineInputBorder textFieldFocusBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: textFieldBorderColor, width: 2.0),
    );
  }

  static OutlineInputBorder textFieldErrorBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.red, width: 2.0),
    );
  }

  static OutlineInputBorder textFieldDisableBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
      borderSide: BorderSide(width: 2.0, color: Colors.grey),
    );
  }

}