import 'package:flutter/material.dart';

const normalFontSize = 12.0;

class AppSizes {
  BuildContext context;

  AppSizes({required this.context});

  double get getHeight => MediaQuery.sizeOf(context).height;

  double get getWidth => MediaQuery.sizeOf(context).height;
}
