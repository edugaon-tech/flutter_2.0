import 'package:flutter/material.dart';

const normalFontSize = 12.0;
const boldFontSize = 24.0;
const semiBoldFontSize = 16.0;
const textFieldsRadius = 10.0;
const normalIconSize = 25.0;

class AppSizes {
  BuildContext context;

  AppSizes({required this.context});

  double get getHeight => MediaQuery.sizeOf(context).height;

  double get getWidth => MediaQuery.sizeOf(context).height;
}
