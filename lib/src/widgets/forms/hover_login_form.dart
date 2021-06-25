import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hover/widgets.dart';
import 'fields/hover_password_field.dart';

import 'base/custom_form.dart';

class HoverLoginForm extends CustomForm {
  HoverLoginForm({
    required Function(String username, String password) onSubmit,
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
    double submitButtonPadding = 14.0,
  }) : super(
          formName: formName,
          title: title,
          titleFontSize: titleFontSize,
          titleFontWeight: titleFontWeight,
          titleColor: titleColor,
          fields: [
            HoverBasicField(
              fieldLabel: "Username",
              fieldName: "username",
            ),
            HoverPasswordField(),
          ],
          onSubmit: (Map<String, String> map) {
            String username = map["username"]!;
            String password = map[HoverPasswordField.fieldName]!;
            onSubmit(username, password);
          },
          submitButtonTextColor: submitButtonTextColor,
          submitButtonColor: submitButtonColor,
          submitButtonText: submitButtonText,
          submitButtonCornerRadius: submitButtonCornerRadius,
          submitButtonTextSize: submitButtonTextSize,
          submitButtonPadding: submitButtonPadding,
        );
}
