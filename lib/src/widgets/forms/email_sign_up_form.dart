import 'package:flutter/widgets.dart';
import 'base/custom_form.dart';
import 'fields/email_field.dart';
import 'fields/password_field.dart';

class EmailSignUpForm extends CustomForm {
  factory EmailSignUpForm({
    @required Future<String> Function(String email, String password) onSubmit,
    @required String formName,
    Color submitButtonColor,
    Color submitButtonTextColor,
  }) {
    return EmailSignUpForm._(
      formName: formName,
      passwordField: PasswordField(
        initialValue: "password",
      ),
      onSubmit: onSubmit,
    );
  }

  EmailSignUpForm._({
    @required Future<String> Function(String email, String password) onSubmit,
    @required PasswordField passwordField,
    @required String formName,
    Color submitButtonColor,
    Color submitButtonTextColor,
  }) : super(
          formName: formName,
          title: "Sign Up",
          fields: [
            EmailField(
              initialValue: "ernpao@gmail.com",
            ),
            passwordField,
            PasswordConfirmationField(passwordField),
          ],
          onSubmit: (Map<String, String> map) {
            String email = map[EmailField.fieldName];
            String password = map[PasswordField.fieldName];
            return onSubmit(email, password);
          },
          submitTextColor: submitButtonTextColor,
          submitColor: submitButtonColor,
          submitText: "Sign up",
        );
}
