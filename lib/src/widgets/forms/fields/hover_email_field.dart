import 'package:flutter/widgets.dart';

import '../base/custom_form_field.dart';
import '../validation/hover_fluent_validator.dart';

class HoverEmailField extends CustomFormField {
  HoverEmailField({
    required TextEditingController controller,
  }) : super(
          name: fieldName,
          label: fieldLabel,
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          validator: HoverFluentValidator()
              .validateAsEmail()
              .validateAsRequired()
              .build(),
        );

  static const fieldName = "email";
  static const fieldLabel = "Email";
}
