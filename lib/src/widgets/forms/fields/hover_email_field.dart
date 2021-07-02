import 'package:flutter/widgets.dart';

import '../base/custom_form_field.dart';
import '../validation/hover_fluent_validator.dart';

class HoverEmailField extends CustomFormField {
  static const String fieldName = "email";
  static const String fieldLabel = "Email";

  HoverEmailField({
    String? initialValue,
  }) : super(
          name: fieldName,
          label: fieldLabel,
          initialValue: initialValue,
          keyboardType: TextInputType.emailAddress,
          validator: HoverFluentValidator()
              .validateAsEmail()
              .validateAsRequired()
              .build(),
        );
}
