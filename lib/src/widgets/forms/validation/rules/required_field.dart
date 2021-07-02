import 'hover_validation_rule.dart';

class RequiredField implements HoverValidationRule {
  @override
  String? validate(String? input) =>
      (input == null || input.isEmpty) ? "This is a required field." : null;
}
