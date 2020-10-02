import 'package:flutter/widgets.dart';
import '../base/custom_form_field.dart';
import '../validation/fluent_form_validation.dart';

class HoverEmailField extends CustomFormField {
  static const String fieldName = "email";
  static const String fieldLabel = "Email";

  HoverEmailField({
    String initialValue,
  }) : super(
          name: fieldName,
          labelText: fieldLabel,
          initialValue: initialValue,
          keyboardType: TextInputType.emailAddress,
          validator: FluentFormValidation()
              .validateAsEmail()
              .validateAsRequired()
              .getValidator,
        );
}
