import 'hover_validation_rule.dart';

class RequireLowercase implements HoverValidationRule {
  @override
  String? validate(String input) => input.contains(RegExp("(?:[a-z])"))
      ? null
      : "Please enter a value that contains lowercase letters.";
}
