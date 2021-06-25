import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'fields/hover_email_field.dart';
import 'fields/hover_password_field.dart';

import 'base/custom_form.dart';

class HoverEmailLoginForm extends CustomForm {
  HoverEmailLoginForm({
    required Function(String? email, String? password) onSubmit,
    required String formName,
    String title = "Welcome Back!",
    double titleFontSize = 28.0,
    Color? titleColor,
    FontWeight titleFontWeight = FontWeight.w600,
    String submitButtonText = "Login",
    double submitButtonTextSize = 16.0,
    Color? submitButtonColor,
    Color? submitButtonTextColor,
    double? submitButtonCornerRadius,
    double? submitButtonPadding = 14.0,
  }) : super(
          formName: formName,
          title: title,
          titleFontSize: titleFontSize,
          titleFontWeight: titleFontWeight,
          titleColor: titleColor,
          fields: [
            HoverEmailField(),
            HoverPasswordField(),
          ],
          submitButtonTextColor: submitButtonTextColor,
          submitButtonColor: submitButtonColor,
          submitButtonText: submitButtonText,
          submitButtonCornerRadius: submitButtonCornerRadius,
          submitButtonTextSize: submitButtonTextSize,
          submitButtonPadding: submitButtonPadding,
          onSubmit: (Map<String, String?> map) {
            String? email = map[HoverEmailField.fieldName];
            String? password = map[HoverPasswordField.fieldName];
            onSubmit(email, password);
          },
        );
}
