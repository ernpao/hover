import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'base/custom_form.dart';
import 'fields/hover_email_field.dart';
import 'fields/hover_password_field.dart';

class HoverEmailSignUpForm extends CustomForm {
  factory HoverEmailSignUpForm({
    required Function(String email, String password) onSubmit,
    required String formName,
    String title = "Sign Up",
    double titleFontSize = 28.0,
    Color? titleColor,
    FontWeight titleFontWeight = FontWeight.w600,
    String submitButtonText = "Sign up with email",
    double submitButtonTextSize = 16.0,
    Color? submitButtonColor,
    Color? submitButtonTextColor,
    double? submitButtonCornerRadius,
    double submitButtonPadding = 14.0,
  }) {
    return HoverEmailSignUpForm._(
      formName: formName,
      passwordField: HoverPasswordField(),
      onSubmit: onSubmit,
      titleColor: titleColor,
    );
  }

  HoverEmailSignUpForm._({
    required Function(String email, String password) onSubmit,
    required String formName,
    String title = "Sign Up",
    double titleFontSize = 28.0,
    Color? titleColor,
    FontWeight titleFontWeight = FontWeight.w600,
    String submitButtonText = "Sign up with email",
    double submitButtonTextSize = 16.0,
    Color? submitButtonColor,
    Color? submitButtonTextColor,
    double? submitButtonCornerRadius,
    double submitButtonPadding = 14.0,
    required HoverPasswordField passwordField,
  }) : super(
          formName: formName,
          title: title,
          titleFontSize: titleFontSize,
          titleFontWeight: titleFontWeight,
          titleColor: titleColor,
          fields: [
            HoverEmailField(),
            passwordField,
            HoverConfirmPasswordField(passwordField),
          ],
          submitButtonTextColor: submitButtonTextColor,
          submitButtonColor: submitButtonColor,
          submitButtonText: submitButtonText,
          submitButtonCornerRadius: submitButtonCornerRadius,
          submitButtonTextSize: submitButtonTextSize,
          submitButtonPadding: submitButtonPadding,
          onSubmit: (Map<String, String> map) {
            String email = map[HoverEmailField.fieldName]!;
            String password = map[HoverPasswordField.fieldName]!;
            onSubmit(email, password);
          },
        );
}
