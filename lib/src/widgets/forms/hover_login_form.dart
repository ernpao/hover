import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'base/custom_form.dart';
import 'fields/hover_basic_field.dart';
import 'fields/hover_password_field.dart';

class HoverLoginForm extends CustomForm {
  HoverLoginForm({
    required Function(String username, String password) onSubmit,
    String? formName,
    String? title,
    double? titleFontSize,
    Color? titleColor,
    FontWeight? titleFontWeight,
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
  }) : super(
          formName: formName,
          title: title ?? "Welcome Back!",
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
            String? username = map["username"];
            String? password = map[HoverPasswordField.fieldName];
            onSubmit(username ?? "", password ?? "");
          },
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
          children: children,
        );
}
