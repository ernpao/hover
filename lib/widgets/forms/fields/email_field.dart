import 'package:flutter/widgets.dart';
import 'package:hover/widgets/forms/base/custom_form_field.dart';
import 'package:hover/widgets/forms/validation/fluent_form_validation.dart';

class EmailField extends CustomFormField {
  static const String fieldName = "email";
  static const String fieldLabel = "Email";

  EmailField({
    String initialValue,
  }) : super(
          name: fieldName,
          labelText: fieldLabel,
          initialValue: initialValue,
          keyboardType: TextInputType.emailAddress,
          validator: FluentFormValidation().validateAsEmail().validateAsRequired().getValidator,
        );
}
