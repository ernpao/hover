import 'hover_validation_rule.dart';

class RequireUppercase implements HoverValidationRule {
  @override
  String? validate(String valueToValidate) {
    bool hasUppercase = valueToValidate.contains(RegExp("(?:[A-Z])"));

    if (!hasUppercase) {
      return "Please enter a value that contains uppercase letters.";
    }

    return null;
  }
}
