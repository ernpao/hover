import 'package:flutter/material.dart';
import 'package:hover/hover.dart';

class LoginFormExample extends HoverPage {
  @override
  Widget render(BuildContext context) {
    return Center(
      child: SizedBox(
        width: Hover.getScreenWidthWithScale(0.9, context),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HoverEmailLoginForm(
                formName: "login-form",
                onSubmit: (email, password) {
                  print(
                      "Sign in form submitted. Email: $email Password: $password");
                  Hover.router.navigateTo("/profile", context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  String get routeName => "/Sign in-form-example";
}
