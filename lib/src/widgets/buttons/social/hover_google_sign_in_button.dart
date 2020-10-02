import 'package:flutter/material.dart';
import 'social_sign_in_button.dart';

class GoogleSignInButton extends SocialSignInButton {
  GoogleSignInButton({
    @required VoidCallback onPressed,
  }) : super(
          imageAssetName: 'images/google-logo.png',
          text: 'Sign in with Google',
          color: Colors.white,
          textColor: Colors.black87,
          onPressed: onPressed,
        );
}
