import 'package:flutter/widgets.dart';
import 'base/custom_form.dart';
import 'fields/hover_email_field.dart';

class HoverPasswordRestForm extends CustomForm {
  HoverPasswordRestForm({
    @required Future<String> Function(String) onSubmit,
    String formName,
  }) : super(
          title: "Password Reset",
          subtitle:
              "Enter the email address for your account and we'll send you a password reset link.",
          formName: formName,
          submitText: "Reset my password",
          fields: [
            HoverEmailField(),
          ],
          onSubmit: (formData) {
            String email = formData[HoverEmailField.fieldName];
            return onSubmit(email);
          },
        );
}
