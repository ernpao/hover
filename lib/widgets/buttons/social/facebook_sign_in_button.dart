import 'package:flutter/material.dart';
import 'package:hover/widgets/buttons/social/social_sign_in_button.dart';

class FacebookSignInButton extends SocialSignInButton {
  FacebookSignInButton({
    @required VoidCallback onPressed,
  }) : super(
          imageAssetName: 'images/facebook-logo.png',
          text: 'Sign in with Facebook',
          color: Color(0xFF334D92),
          textColor: Colors.white,
          onPressed: onPressed,
        );
}
