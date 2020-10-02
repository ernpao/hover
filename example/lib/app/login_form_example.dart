import 'package:flutter/material.dart';
import 'package:hover/hover.dart';

import 'package:hover/hover_widgets.dart';

class LoginFormExample extends HoverPage {
  @override
  Widget render(BuildContext context) {
    return Container(
      child: HoverEmailSignInForm(
        formName: "Login",
        onSubmit: (email, password) {
          print("Login form submitted. Email: $email Password: $password");
          Hover.router.navigateTo("/profile", context);
        },
        submitButtonColor: Colors.blue,
        submitTextColor: Colors.white,
      ),
    );
  }

  @override
  String get routeName => "/login-form-example";
}
