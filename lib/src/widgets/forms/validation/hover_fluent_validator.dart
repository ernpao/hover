import 'rules/email_validation_rule.dart';
import 'rules/input_length_rule.dart';
import 'rules/password_confirmation_rule.dart';
import 'rules/required_field_rule.dart';
import 'rules/hover_validation_rule.dart';

abstract class HoverValidator {
  /// Generates the validation function.
  String? Function(String) build();

  /// Returns an error message string
  /// to display if the input [valueToValidate]
  /// not pass a validation
  /// test and returns null otherwise.
  String? validate(String valueToValidate);

  /// Adds a rule that will validate that
  /// the input string is a valid
  /// email address.
  HoverValidator validateAsEmail();

  /// Adds a rule that will ensure the input
  /// meets a minimum password length
  /// [passwordMinLength].
  HoverValidator validateAsPassword(int passwordMinLength);

  /// Adds a rule that will ensure the input
  /// matches the [passwordConfirmation] value.
  HoverValidator validateAsPasswordConfirmation(String passwordConfirmation);

  /// Adds a rule that will ensure the
  /// input is not null.
  HoverValidator validateAsRequired();

  /// Add a custom validation rule.
  HoverValidator addValidator(HoverValidationRule validationRule);
}

class HoverFluentValidator implements HoverValidator {
  List<HoverValidationRule> _validationRules = [];

  @override
  String? validate(String? valueToValidate) {
    String? result;

    for (HoverValidationRule rule in _validationRules) {
      String? validationMessage = rule.validate(valueToValidate!);
      if (validationMessage != null && validationMessage.isNotEmpty) {
        result = validationMessage;
      }
    }

    return result;
  }

  @override
  HoverFluentValidator validateAsEmail() {
    _validationRules.add(EmailValidationRule());
    return this;
  }

  @override
  HoverFluentValidator validateAsPassword(int passwordMinLength) {
    _validationRules.add(MinLengthRule(passwordMinLength));
    return this;
  }

  @override
  HoverFluentValidator validateAsRequired() {
    _validationRules.add(RequiredFieldValidationRule());
    return this;
  }

  @override
  HoverFluentValidator validateAsPasswordConfirmation(
      String passwordConfirmation) {
    _validationRules.add(PasswordConfirmationRule(passwordConfirmation));
    return this;
  }

  @override
  String? Function(String?) build() => validate;

  @override
  HoverFluentValidator addValidator(HoverValidationRule validationRule) {
    _validationRules.add(validationRule);
    return this;
  }
}
