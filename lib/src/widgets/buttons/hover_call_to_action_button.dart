import 'package:flutter/widgets.dart';
import 'base/custom_button_text.dart';
import 'base/custom_raised_button.dart';

class HoverCallToActionButton extends CustomRaisedButton {
  HoverCallToActionButton({
    required String text,
    Color? color,
    Color? textColor,
    double? letterSpacing,
    FontWeight? fontWeight = FontWeight.bold,
    double? cornerRadius = 8.0,
    double? textPadding = 16.0,
    TextAlign? textAlign = TextAlign.center,
    double? width,
    double? height,
    required Function()? onPressed,
  }) : super(
          child: CustomButtonText(
            text: text,
            textColor: textColor,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing,
            textAlign: textAlign,
          ),
          color: color,
          height: height,
          width: width,
          onPressed: onPressed,
          cornerRadius: cornerRadius,
          textPadding: textPadding,
        );
}
