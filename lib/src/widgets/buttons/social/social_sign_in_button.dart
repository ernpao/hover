import 'package:flutter/widgets.dart';
import '../base/custom_button_text.dart';
import '../base/custom_raised_button.dart';

abstract class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton({
    @required String text,
    @required String imageAssetName,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  })  : assert(imageAssetName != null),
        assert(text != null),
        super(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(imageAssetName),
              CustomButtonText(
                text: text,
                textColor: textColor,
              ),
              Opacity(
                opacity: 0.0,
                child: Image.asset(imageAssetName),
              ),
            ],
          ),
          color: color,
        );
}
