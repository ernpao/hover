import 'hover_validation_rule.dart';

class RequireSpecialCharacters implements HoverValidationRule {
  @override
  String? validate(String valueToValidate) {
    bool hasSpecial = valueToValidate.contains(RegExp("(?=.*[@#\$%^&+=])"));

    if (!hasSpecial) {
      return "At least one character among the following is required: @#\$%^&+= ";
    }

    return null;
  }
}
