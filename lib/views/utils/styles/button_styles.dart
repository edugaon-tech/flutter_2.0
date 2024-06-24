import 'package:flutter/material.dart';
import 'package:flutter_learn_bipul/views/utils/colors.dart';

class AppButtonStyles {
  ButtonStyle appButton({Color bgColor = appButtonColor}) =>
      ElevatedButton.styleFrom(backgroundColor: bgColor);
}
