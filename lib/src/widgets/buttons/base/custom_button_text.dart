import 'package:flutter/widgets.dart';

class CustomButtonText extends Text {
  CustomButtonText({
    required String text,
    Color? textColor,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? fontSize,
  }) : super(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing,
          ),
        );
}
