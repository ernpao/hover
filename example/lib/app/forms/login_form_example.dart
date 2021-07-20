import 'package:flutter/material.dart';
import 'package:hover/hover.dart';

class LoginFormExample extends HoverPage {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
                emailController: emailController,
                passwordController: passwordController,
                onSubmit: (email, password) {
                  print(
                      "Sign in form submitted. Email: $email Password: $password");
                  Hover.router.navigateTo("/profile", context);
                },
                children: [
                  HoverCallToActionButton(
                    text: "Create A New Account",
                    onPressed: () {
                      Hover.router.navigateTo(
                        "/sign-up-form-example",
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
  String get routeName => "/login-in-form-example";
}
