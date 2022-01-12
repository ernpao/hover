import 'package:flutter/widgets.dart';

import 'base/custom_button_text.dart';
import 'base/custom_raised_button.dart';

class HoverCallToActionButton extends CustomRaisedButton {
  HoverCallToActionButton({
    required String text,
    Color? color,
    Color? overlayColor,
    Color? textColor,
    double? letterSpacing,
    FontWeight? fontWeight = FontWeight.bold,
    double? cornerRadius,
    double? horizontalPadding,
    double? verticalPadding,
    double? margin,
    double? maxWidth,
    TextAlign? textAlign = TextAlign.center,
    required Function()? onPressed,
    bool enabled = true,
  }) : super(
          child: CustomButtonText(
            text: text,
            textColor: textColor,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing,
          ),
          color: color,
          overlayColor: overlayColor,
          onPressed: onPressed,
          cornerRadius: cornerRadius,
          horizontalPadding: horizontalPadding,
          verticalPadding: verticalPadding,
          margin: margin,
          maxWidth: maxWidth,
          enabled: enabled,
        );
}
