import 'package:flutter/widgets.dart';
import 'base/custom_form.dart';
import 'fields/email_field.dart';

class PasswordRestForm extends CustomForm {
  PasswordRestForm({
    @required Future<String> Function(String) onSubmit,
    String formName,
  }) : super(
          title: "Password Reset",
          subtitle:
              "Enter the email address for your account and we'll send you a password reset link.",
          formName: formName,
          submitText: "Reset my password",
          fields: [
            EmailField(),
          ],
          onSubmit: (formData) {
            String email = formData[EmailField.fieldName];
            return onSubmit(email);
          },
        );
}
