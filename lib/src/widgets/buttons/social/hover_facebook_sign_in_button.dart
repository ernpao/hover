import 'package:flutter/material.dart';
import 'social_sign_in_button.dart';

class HoverFacebookSignInButton extends SocialSignInButton {
  HoverFacebookSignInButton({required Function()? onPressed})
      : super(
          imageAssetName: 'images/facebook-logo.png',
          text: 'Sign in with Facebook',
          color: Color(0xFF334D92),
          textColor: Colors.white,
          onPressed: onPressed,
        );
}
