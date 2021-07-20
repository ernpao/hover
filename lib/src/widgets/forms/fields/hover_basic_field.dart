import 'package:flutter/cupertino.dart';

import '../base/custom_form_field.dart';

class HoverBasicField extends CustomFormField {
  final String fieldName;
  final String fieldLabel;
  final TextEditingController controller;

  /// A function that returns an error message string
  /// to display if the input [valueToValidate] not pass a validation
  /// test and returns null otherwise.
  final String? Function(String?)? validator;

  HoverBasicField({
    required this.controller,
    required this.fieldName,
    required this.fieldLabel,
    this.validator,
  }) : super(
          name: fieldName,
          label: fieldLabel,
          validator: validator,
          controller: controller,
        );
}
