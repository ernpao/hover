import 'hover_validation_rule.dart';

class PasswordConfirmation implements HoverValidationRule {
  PasswordConfirmation(this.passwordConfirmation);
  final String passwordConfirmation;

  @override
  String? validate(String password) {
    print("Comparing '$password' against '$passwordConfirmation'");
    if (password.startsWith(passwordConfirmation) &&
        password.endsWith(passwordConfirmation) &&
        password.hashCode == passwordConfirmation.hashCode) {
      return null;
    }
    return "Value is not the same as the entered password.";
  }
}
