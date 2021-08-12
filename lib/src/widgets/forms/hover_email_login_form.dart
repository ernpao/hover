import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'base/custom_form.dart';
import 'fields/hover_email_field.dart';
import 'fields/hover_password_field.dart';

class HoverEmailLoginForm extends CustomForm {
  HoverEmailLoginForm({
    required Function(String email, String password) onSubmit,
    String? formName,
    String? title,
    double? titleFontSize,
    Color? titleColor,
    FontWeight? titleFontWeight,
    TextStyle? titleStyle,
    String? submitButtonText,
    double? submitButtonTextSize,
    Color? submitButtonColor,
    Color? submitButtonTextColor,
    double? submitButtonCornerRadius,
    double? submitButtonHorizontalPadding,
    double? submitButtonVerticalPadding,
    String? subtitle,
    Color? subtitleColor,
    double? subtitleFontSize,
    FontWeight? subtitleFontWeight,
    List<Widget>? children,
    bool enabled = true,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) : super(
          formName: formName,
          title: title ?? "Welcome Back!",
          titleFontSize: titleFontSize,
          titleFontWeight: titleFontWeight,
          titleColor: titleColor,
          titleStyle: titleStyle,
          fields: [
            HoverEmailField(controller: emailController),
            HoverPasswordField(controller: passwordController),
          ],
          submitButtonTextColor: submitButtonTextColor,
          submitButtonColor: submitButtonColor,
          submitButtonText: submitButtonText ?? "Login",
          submitButtonCornerRadius: submitButtonCornerRadius,
          submitButtonTextSize: submitButtonTextSize,
          submitButtonHorizontalPadding: submitButtonHorizontalPadding,
          submitButtonVerticalPadding: submitButtonVerticalPadding,
          subtitle: subtitle,
          subtitleColor: subtitleColor,
          subtitleFontSize: subtitleFontSize,
          subtitleFontWeight: subtitleFontWeight,
          onSubmit: (Map<String, String> map) {
            String? email = map[HoverEmailField.fieldName];
            String? password = map[HoverPasswordField.fieldName];
            onSubmit(email ?? "", password ?? "");
          },
          children: children,
          enabled: enabled,
        );
}
