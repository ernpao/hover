import 'package:flutter/widgets.dart';
import '../base/custom_form_field.dart';
import '../validation/fluent_form_validation.dart';

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
          validator: FluentFormValidation()
              .validateAsPassword(8)
              .validateAsRequired()
              .getValidator,
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
          validator: FluentFormValidation()
              .validateAsPassword(8)
              .validateAsPasswordConfirmation(passwordFieldToConfirm.getValue())
              .validateAsRequired()
              .getValidator,
        );
}
