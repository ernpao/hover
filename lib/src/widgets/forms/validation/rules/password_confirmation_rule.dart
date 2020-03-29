import 'validation_rule.dart';

class PasswordConfirmationRule implements ValidationRule {
  PasswordConfirmationRule(this._passwordConfirmationValue);
  final String _passwordConfirmationValue;

  @override
  String validate(String valueToValidate) {
    if (valueToValidate != _passwordConfirmationValue) {
      return "Both passwords fields must match.";
    }
    return null;
  }
}
