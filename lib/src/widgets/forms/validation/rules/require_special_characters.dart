import 'hover_validation_rule.dart';

class RequireSpecialCharacters implements HoverValidationRule {
  @override
  String? validate(String input) => input.contains(RegExp(r'(?=.*[@#$%^&+=])'))
      ? null
      : "At least one character among the following is required: @#\$%^&+= ";
}
