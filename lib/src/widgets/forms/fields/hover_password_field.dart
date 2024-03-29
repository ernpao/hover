import 'package:flutter/widgets.dart';

import '../base/custom_form_field.dart';
import '../validation/hover_fluent_validator.dart';

class _PasswordField extends CustomFormField {
  _PasswordField({
    required String name,
    required String labelText,
    required String? Function(String?) validator,
    required TextEditingController controller,
  }) : super(
          controller: controller,
          name: name,
          label: labelText,
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          validator: validator,
        );
}

class HoverPasswordField extends _PasswordField {
  static const fieldName = "password";
  static const fieldLabel = "Password";

  HoverPasswordField({
    int? passwordMinLength,
    bool? requireLowercase,
    bool? requireUppercase,
    bool? requireSpecialCharacters,
    required TextEditingController controller,
  }) : super(
          controller: controller,
          name: fieldName,
          labelText: fieldLabel,
          validator: HoverFluentValidator()
              .validateAsPassword(
                passwordMinLength ?? 8,
                mustContainLowercase: requireLowercase ?? false,
                mustContainUppercase: requireUppercase ?? false,
                mustContainNumber: requireSpecialCharacters ?? false,
              )
              .validateAsRequired()
              .build(),
        );
}

class HoverConfirmPasswordField extends _PasswordField {
  static const fieldName = "password_confirmation";
  static const fieldLabel = "Confirm Password";

  final HoverPasswordField passwordFieldToConfirm;
  HoverConfirmPasswordField(
    this.passwordFieldToConfirm, {
    required TextEditingController controller,
  }) : super(
            controller: controller,
            name: fieldName,
            labelText: fieldLabel,
            validator: (input) {
              print("Password Input: ${passwordFieldToConfirm.value}");
              print("Confirmation Input: $input");

              return HoverFluentValidator()
                  .validateAsPasswordConfirmation(passwordFieldToConfirm.value)
                  .validateAsRequired()
                  .validate(input);
            });
}
