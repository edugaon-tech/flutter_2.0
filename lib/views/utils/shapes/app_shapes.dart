import 'package:flutter/cupertino.dart';
import 'package:flutter_learn_bipul/views/utils/colors.dart';

class AppShapes {
  BoxDecoration rectangularShape(
          {Color bgColor = primaryColor,
          double radius = 10.0,
          BoxShape shape = BoxShape.rectangle}) =>
      BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(radius),
          shape: shape);

  BoxDecoration circularShape(
          {Color bgColor = primaryColor,
          double radius = 10.0,
          BoxShape shape = BoxShape.circle}) =>
      BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(radius),
          shape: shape);
}
