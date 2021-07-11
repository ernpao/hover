import 'package:flutter/material.dart';
import 'package:hover/hover.dart';

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
                title: "Create An Account!",
                subtitle: "This is some sample subtitle",
                formName: "sign-up-form",
                onSubmit: (email, password) {
                  print(
                      "Sign up form submitted. Email: $email Password: $password");
                  Hover.showPlainSnackBar(context,
                      "Sign up form submitted. Email: $email Password: $password");
                },
                submitButtonColor: Colors.blue,
                submitButtonTextColor: Colors.white,
                requireLowercase: true,
                requireUppercase: true,
                requireSpecialCharacters: true,
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
