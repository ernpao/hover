import 'package:hover/widgets/forms/validation/rules/validation_rule.dart';

class RequiredFieldValidationRule implements ValidationRule {
  @override
  String validate(String value) {
    if (value == null || value.isEmpty) {
      return "This is a required field.";
    }

    return null;
  }
}
