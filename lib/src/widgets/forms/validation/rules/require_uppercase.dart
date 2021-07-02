import 'hover_validation_rule.dart';

class RequireUppercase implements HoverValidationRule {
  @override
  String? validate(String valueToValidate) =>
      valueToValidate.contains(RegExp("(?:[A-Z])"))
          ? null
          : "Please enter a value that contains uppercase letters.";
}
