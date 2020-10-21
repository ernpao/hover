import 'package:flutter/widgets.dart';
import '../base/custom_form_field.dart';
import '../validation/hover_fluent_validator.dart';

class _PasswordField extends CustomFormField {
  _PasswordField({
    @required String name,
    @required String labelText,
    String initialValue,
    String Function(String) validator,
  }) : super(
            name: name,
            labelText: labelText,
            initialValue: initialValue,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            validator: validator);
}

class PasswordField extends _PasswordField {
  static const String fieldName = "password";
  static const String fieldLabel = "Password";

  PasswordField({
    String initialValue,
  }) : super(
          name: fieldName,
          labelText: fieldLabel,
          initialValue: initialValue,
          validator: HoverFluentValidator()
              .validateAsPassword(8)
              .validateAsRequired()
              .build,
        );
}

class PasswordConfirmationField extends _PasswordField {
  static const String fieldName = "password_confirmation";
  static const String fieldLabel = "Confirm Password";

  final PasswordField passwordFieldToConfirm;
  PasswordConfirmationField(this.passwordFieldToConfirm)
      : super(
          name: fieldName,
          labelText: fieldLabel,
          initialValue: passwordFieldToConfirm.initialValue,
          validator: HoverFluentValidator()
              .validateAsPassword(8)
              .validateAsPasswordConfirmation(passwordFieldToConfirm.getValue())
              .validateAsRequired()
              .build,
        );
}
