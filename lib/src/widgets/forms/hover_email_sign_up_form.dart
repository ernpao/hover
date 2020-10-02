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
  }) {
    return HoverEmailSignUpForm._(
      formName: formName,
      passwordField: PasswordField(),
      onSubmit: onSubmit,
    );
  }

  HoverEmailSignUpForm._({
    @required Function(String email, String password) onSubmit,
    @required PasswordField passwordField,
    @required String formName,
    Color submitButtonColor,
    Color submitButtonTextColor,
  }) : super(
          formName: formName,
          title: "Sign Up",
          fields: [
            HoverEmailField(),
            passwordField,
            PasswordConfirmationField(passwordField),
          ],
          onSubmit: (Map<String, String> map) {
            String email = map[HoverEmailField.fieldName];
            String password = map[PasswordField.fieldName];
            onSubmit(email, password);
          },
          submitTextColor: submitButtonTextColor,
          submitColor: submitButtonColor,
          submitText: "Sign up",
        );
}
