import 'package:flutter/material.dart';
import 'social_sign_in_button.dart';

class HoverGoogleSignInButton extends SocialSignInButton {
  HoverGoogleSignInButton({required Function()? onPressed})
      : super(
          imageAssetName: 'images/google-logo.png',
          text: 'Sign in with Google',
          color: Colors.white,
          textColor: Colors.black87,
          onPressed: onPressed,
        );
}
