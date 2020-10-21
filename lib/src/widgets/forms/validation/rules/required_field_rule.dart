import 'hover_validation_rule.dart';

class RequiredFieldValidationRule implements HoverValidationRule {
  @override
  String validate(String value) {
    if (value == null || value.isEmpty) {
      return "This is a required field.";
    }

    return null;
  }
}
