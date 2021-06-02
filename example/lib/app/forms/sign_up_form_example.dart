import 'package:flutter/material.dart';
import 'package:hover/framework.dart';

import 'package:hover/widgets.dart';

class SignUpFormExample extends HoverPage {
  @override
  Widget render(BuildContext context) {
    return Center(
      child: SizedBox(
        width: Hover.getScreenWidthWithScale(0.9, context),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HoverEmailSignUpForm(
                formName: "Sign Up",
                onSubmit: (email, password) {
                  print(
                      "Sign up form submitted. Email: $email Password: $password");
                  Hover.showPlainSnackBar(context,
                      "Sign up form submitted. Email: $email Password: $password");
                },
                submitButtonColor: Colors.blue,
                submitButtonTextColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  String get routeName => "/sign-up-form-example";
}
