import 'package:flutter/widgets.dart';

class CustomButtonText extends Text {
  CustomButtonText({
    @required String text,
    Color textColor,
    FontWeight fontWeight,
    double letterSpacing,
  })  : assert(text != null),
        super(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 12.0,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing,
          ),
        );
}
