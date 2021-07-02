import 'hover_validation_rule.dart';

class EmailValidation implements HoverValidationRule {
  @override
  String? validate(String email) {
    const pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
    bool r = RegExp(pattern).hasMatch(email);
    return r ? null : "Please enter a valid email address.";
  }
}
