import 'package:flutter/widgets.dart';
import 'package:hover/widgets/buttons/base/custom_button_text.dart';
import 'package:hover/widgets/buttons/base/custom_raised_button.dart';

class CallToActionButton extends CustomRaisedButton {
  CallToActionButton({
    @required String text,
    Color color,
    Color textColor,
    double letterSpacing,
    FontWeight fontWeight: FontWeight.bold,
    double borderRadius: 8.0,
    double textPadding,
    @required VoidCallback onPressed,
  })  : assert(text != null),
        super(
          child: CustomButtonText(
            text: text,
            textColor: textColor,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing,
          ),
          color: color,
          onPressed: onPressed,
          borderRadius: borderRadius,
          textPadding: textPadding,
        );
}
