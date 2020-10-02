import 'package:flutter/widgets.dart';
import 'fields/hover_email_field.dart';
import 'fields/hover_password_field.dart';

import 'base/custom_form.dart';

class HoverEmailSignInForm extends CustomForm {
  HoverEmailSignInForm({
    @required Function(String email, String password) onSubmit,
    @required String formName,
    Color submitTextColor,
    Color submitButtonColor,
  }) : super(
          formName: formName,
          title: "Sign In",
          fields: [
            HoverEmailField(),
            PasswordField(),
          ],
          onSubmit: (Map<String, String> map) {
            String email = map[HoverEmailField.fieldName];
            String password = map[PasswordField.fieldName];
            onSubmit(email, password);
          },
          submitTextColor: submitTextColor,
          submitColor: submitButtonColor,
          submitText: "Sign in with email",
        );
}
