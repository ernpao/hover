import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'base/custom_form.dart';
import 'fields/hover_email_field.dart';
import 'fields/hover_password_field.dart';

class HoverEmailSignUpForm extends CustomForm {
  factory HoverEmailSignUpForm({
    required Function(String email, String password) onSubmit,
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
    int? passwordMinLength,
    bool? requireLowercase,
    bool? requireUppercase,
    bool? requireSpecialCharacters,
    List<Widget>? children,
    bool enabled = true,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController passwordConfirmationController,
  }) {
    return HoverEmailSignUpForm._(
      formName: formName,
      title: title,
      titleFontSize: titleFontSize,
      titleColor: titleColor,
      titleFontWeight: titleFontWeight,
      submitButtonText: submitButtonText,
      submitButtonColor: submitButtonColor,
      submitButtonCornerRadius: submitButtonCornerRadius,
      submitButtonHorizontalPadding: submitButtonHorizontalPadding,
      submitButtonVerticalPadding: submitButtonVerticalPadding,
      submitButtonTextColor: submitButtonTextColor,
      submitButtonTextSize: submitButtonTextSize,
      passwordField: HoverPasswordField(
        passwordMinLength: passwordMinLength,
        requireLowercase: requireLowercase,
        requireUppercase: requireUppercase,
        requireSpecialCharacters: requireSpecialCharacters,
        controller: passwordController,
      ),
      onSubmit: onSubmit,
      subtitle: subtitle,
      subtitleColor: subtitleColor,
      subtitleFontSize: subtitleFontSize,
      subtitleFontWeight: subtitleFontWeight,
      children: children,
      enabled: enabled,
      emailController: emailController,
      passwordConfirmationController: passwordConfirmationController,
    );
  }

  HoverEmailSignUpForm._({
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
    required HoverPasswordField passwordField,
    required Function(String email, String password) onSubmit,
    List<Widget>? children,
    bool enabled = true,
    required TextEditingController emailController,
    required TextEditingController passwordConfirmationController,
  }) : super(
          formName: formName,
          title: title ?? "Sign Up",
          titleFontSize: titleFontSize,
          titleFontWeight: titleFontWeight,
          titleColor: titleColor,
          fields: [
            HoverEmailField(controller: emailController),
            passwordField,
            HoverConfirmPasswordField(
              passwordField,
              controller: passwordConfirmationController,
            ),
          ],
          submitButtonTextColor: submitButtonTextColor,
          submitButtonColor: submitButtonColor,
          submitButtonText: submitButtonText ?? "Create My Account",
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
