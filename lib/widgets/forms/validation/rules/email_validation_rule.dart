import 'package:hover/widgets/forms/validation/rules/validation_rule.dart';

class EmailValidationRule implements ValidationRule {
  @override
  String validate(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(email);

    if (!emailValid) {
      return "Please enter a valid email address";
    }

    return null;
  }
}
