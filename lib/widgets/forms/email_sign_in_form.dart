import 'package:flutter/widgets.dart';
import 'package:hover/widgets/forms/fields/email_field.dart';
import 'package:hover/widgets/forms/fields/password_field.dart';

import 'base/custom_form.dart';

class EmailSignInForm extends CustomForm {
  EmailSignInForm({
    @required Future<String> Function(String email, String password) onSubmit,
    @required String formName,
    Color submitTextColor,
    Color submitButtonColor,
  }) : super(
          formName: formName,
          title: "Sign In",
          fields: [
            EmailField(initialValue: "ernpao@gmail.com"),
            PasswordField(initialValue: "password"),
          ],
          onSubmit: (Map<String, String> map) {
            String email = map[EmailField.fieldName];
            String password = map[PasswordField.fieldName];
            return onSubmit(email, password);
          },
          submitTextColor: submitTextColor,
          submitColor: submitButtonColor,
          submitText: "Sign in with email",
        );
}
