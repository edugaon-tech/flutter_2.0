import 'dart:ui';

import 'package:flutter_learn_bipul/views/utils/colors.dart';
import 'package:flutter_learn_bipul/views/utils/sizes.dart';

class AppTextStyles {
   normalTextStyle() =>
      TextStyle(color: normalTextColor, fontSize: normalFontSize);

   TextStyle ?boldTextStyle(
          {Color textColor = boldTextColor, double fontSize = boldFontSize}) =>
      TextStyle(color: textColor, fontSize: fontSize);
}
