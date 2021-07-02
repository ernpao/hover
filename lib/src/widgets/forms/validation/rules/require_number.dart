import 'hover_validation_rule.dart';

class RequireNumber implements HoverValidationRule {
  @override
  String? validate(String input) => input.contains(RegExp("(?:[0-9])"))
      ? null
      : "Please enter a value that contains a number from 0-9.";
}
