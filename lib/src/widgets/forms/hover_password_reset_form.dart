import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'base/custom_form.dart';
import 'fields/hover_email_field.dart';

class HoverPasswordResetForm extends CustomForm {
  HoverPasswordResetForm({
    required Function(String email) onSubmit,
    String? formName,
    String? title,
    double? titleFontSize,
    Color? titleColor,
    TextStyle? titleStyle,
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
    bool enabled = true,
    required TextEditingController emailController,
  }) : super(
          formName: formName,
          title: title ?? "Reset Your Password",
          titleFontSize: titleFontSize,
          titleFontWeight: titleFontWeight,
          titleColor: titleColor,
          titleStyle: titleStyle,
          fields: [
            HoverEmailField(controller: emailController),
          ],
          submitButtonTextColor: submitButtonTextColor,
          submitButtonColor: submitButtonColor,
          submitButtonText: submitButtonText ?? "Reset My Password",
          submitButtonCornerRadius: submitButtonCornerRadius,
          submitButtonTextSize: submitButtonTextSize,
          submitButtonHorizontalPadding: submitButtonHorizontalPadding,
          submitButtonVerticalPadding: submitButtonVerticalPadding,
          subtitle: subtitle ??
              "Enter the email address linked to your account and we'll send you a password reset link.",
          subtitleColor: subtitleColor,
          subtitleFontSize: subtitleFontSize,
          subtitleFontWeight: subtitleFontWeight,
          onSubmit: (Map<String, String?> map) {
            String? email = map[HoverEmailField.fieldName];
            onSubmit(email ?? "");
          },
          children: children,
          enabled: enabled,
        );
}
