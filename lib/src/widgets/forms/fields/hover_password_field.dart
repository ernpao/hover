import 'package:flutter/widgets.dart';
import '../base/custom_form_field.dart';
import '../validation/hover_fluent_validator.dart';

class _PasswordField extends CustomFormField {
  _PasswordField({
    required String name,
    required String labelText,
    String? initialValue,
    required String? Function(String?) validator,
  }) : super(
            name: name,
            label: labelText,
            initialValue: initialValue,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            validator: validator);
}

class HoverPasswordField extends _PasswordField {
  static const String fieldName = "password";
  static const String fieldLabel = "Password";

  HoverPasswordField({
    String? initialValue,
  }) : super(
          name: fieldName,
          labelText: fieldLabel,
          initialValue: initialValue,
          validator: HoverFluentValidator()
              .validateAsPassword(8)
              .validateAsRequired()
              .build(),
        );
}

class HoverConfirmPasswordField extends _PasswordField {
  static const String fieldName = "password_confirmation";
  static const String fieldLabel = "Confirm Password";

  final HoverPasswordField passwordFieldToConfirm;
  HoverConfirmPasswordField(this.passwordFieldToConfirm)
      : super(
            name: fieldName,
            labelText: fieldLabel,
            initialValue: passwordFieldToConfirm.initialValue,
            validator: (input) {
              print("Password Input: ${passwordFieldToConfirm.value}");
              print("Confirmation Input: $input");

              return HoverFluentValidator()
                  .validateAsPassword(8)
                  .validateAsPasswordConfirmation(passwordFieldToConfirm.value)
                  .validateAsRequired()
                  .validate(input);
            });
}
