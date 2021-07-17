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
                requireLowercase: true,
                requireUppercase: true,
                requireSpecialCharacters: true,
                children: [
                  HoverCallToActionButton(
                    text: "Log In With Existing Account",
                    onPressed: () {
                      Hover.router.navigateTo(
                        "/login-in-form-example",
                        context,
                        push: true,
                      );
                    },
                  )
                ],
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
