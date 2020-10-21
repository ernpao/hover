import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'base/custom_form.dart';
import 'fields/hover_email_field.dart';
import 'fields/hover_password_field.dart';

class HoverEmailSignUpForm extends CustomForm {
  factory HoverEmailSignUpForm({
    @required Function(String email, String password) onSubmit,
    @required String formName,
    Color submitButtonColor,
    Color submitButtonTextColor,
    Color titleColor = Colors.black,
  }) {
    return HoverEmailSignUpForm._(
      formName: formName,
      passwordField: HoverPasswordField(),
      onSubmit: onSubmit,
      titleColor: titleColor,
    );
  }

  HoverEmailSignUpForm._({
    @required Function(String email, String password) onSubmit,
    @required HoverPasswordField passwordField,
    @required String formName,
    Color submitButtonColor,
    Color submitButtonTextColor,
    Color titleColor = Colors.black,
  }) : super(
          formName: formName,
          title: "Sign Up",
          titleColor: titleColor,
          fields: [
            HoverEmailField(),
            passwordField,
            PasswordConfirmationField(passwordField),
          ],
          onSubmit: (Map<String, String> map) {
            String email = map[HoverEmailField.fieldName];
            String password = map[HoverPasswordField.fieldName];
            onSubmit(email, password);
          },
          submitTextColor: submitButtonTextColor,
          submitColor: submitButtonColor,
          submitText: "Sign up",
        );
}
