import 'hover_validation_rule.dart';

class RequireLowercase implements HoverValidationRule {
  @override
  String? validate(String valueToValidate) {
    bool hasLowercaseLetters = valueToValidate.contains(RegExp("(?:[a-z])"));

    if (!hasLowercaseLetters) {
      return "Please enter a value that contains lowercase letters.";
    }

    return null;
  }
}
