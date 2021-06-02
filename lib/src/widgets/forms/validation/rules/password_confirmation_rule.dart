import 'hover_validation_rule.dart';

class PasswordConfirmationRule implements HoverValidationRule {
  PasswordConfirmationRule(this._passwordConfirmationValue);
  final String _passwordConfirmationValue;

  @override
  String validate(String valueToValidate) {
    print(
        "Comparing passwords: $_passwordConfirmationValue vs $valueToValidate");
    if (valueToValidate.startsWith(_passwordConfirmationValue) &&
        valueToValidate.endsWith(_passwordConfirmationValue) &&
        valueToValidate.hashCode == _passwordConfirmationValue.hashCode) {
      return null;
    }
    return "Value is not the same as the entered password.";
  }
}
