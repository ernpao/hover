import 'rules/email_validation.dart';
import 'rules/hover_validation_rule.dart';
import 'rules/input_length.dart';
import 'rules/password_confirmation.dart';
import 'rules/require_lowercase.dart';
import 'rules/require_number.dart';
import 'rules/require_uppercase.dart';
import 'rules/required_field.dart';

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
  /// [passwordMinLength]. Can also be configured
  /// to require uppercase letters, lowercase letters,
  /// or special characters.
  HoverValidator validateAsPassword(
    int passwordMinLength, {
    bool mustContainUppercase = false,
    bool mustContainLowercase = false,
    bool mustContainNumber = false,
  });

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
        if (result != null) {
          result += "\n" + validationMessage;
        } else {
          result = validationMessage;
        }
      }
    }

    return result;
  }

  @override
  HoverFluentValidator validateAsEmail() {
    _validationRules.add(EmailValidation());
    return this;
  }

  @override
  HoverFluentValidator validateAsPassword(
    int passwordMinLength, {
    bool mustContainUppercase = false,
    bool mustContainLowercase = false,
    bool mustContainNumber = false,
  }) {
    _validationRules.add(MinLengthRule(passwordMinLength));

    if (mustContainUppercase) {
      _validationRules.add(RequireUppercase());
    }

    if (mustContainLowercase) {
      _validationRules.add(RequireLowercase());
    }

    if (mustContainNumber) {
      _validationRules.add(RequireNumber());
    }

    return this;
  }

  @override
  HoverFluentValidator validateAsRequired() {
    _validationRules.add(RequiredField());
    return this;
  }

  @override
  HoverFluentValidator validateAsPasswordConfirmation(
      String passwordConfirmation) {
    _validationRules.add(PasswordConfirmation(passwordConfirmation));
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
