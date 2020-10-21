import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hover/hover_widgets.dart';
import 'fields/hover_password_field.dart';

import 'base/custom_form.dart';

class HoverSignInForm extends CustomForm {
  HoverSignInForm({
    @required Function(String username, String password) onSubmit,
    @required String formName,
    Color submitTextColor,
    Color submitButtonColor,
    Color titleColor = Colors.black,
  }) : super(
          formName: formName,
          title: "Sign In",
          titleColor: titleColor,
          fields: [
            HoverBasicField(
              fieldLabel: "Username",
              fieldName: "username",
            ),
            HoverPasswordField(),
          ],
          onSubmit: (Map<String, String> map) {
            String username = map["username"];
            String password = map[HoverPasswordField.fieldName];
            onSubmit(username, password);
          },
          submitTextColor: submitTextColor,
          submitColor: submitButtonColor,
          submitText: "Sign in",
        );
}
