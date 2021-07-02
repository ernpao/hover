import 'hover_validation_rule.dart';

class RequireNumber implements HoverValidationRule {
  @override
  String? validate(String valueToValidate) {
    bool hasUppercase = valueToValidate.contains(RegExp("(?:[0-9])"));

    if (!hasUppercase) {
      return "Please enter a value that contains a number from 0-9.";
    }

    return null;
  }
}
