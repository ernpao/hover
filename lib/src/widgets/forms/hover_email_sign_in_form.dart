import 'package:flutter/material.dart';
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
    Color titleColor = Colors.black,
  }) : super(
          formName: formName,
          title: "Sign In",
          titleColor: titleColor,
          fields: [
            HoverEmailField(),
            HoverPasswordField(),
          ],
          onSubmit: (Map<String, String> map) {
            String email = map[HoverEmailField.fieldName];
            String password = map[HoverPasswordField.fieldName];
            onSubmit(email, password);
          },
          submitTextColor: submitTextColor,
          submitColor: submitButtonColor,
          submitText: "Sign in with email",
        );
}
