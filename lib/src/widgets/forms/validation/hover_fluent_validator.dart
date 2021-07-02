import 'rules/rules.dart';

export 'rules/rules.dart';

abstract class HoverValidator {
  /// Generates the validation function.
  String? Function(String) build();

  /// Returns validation error messages as
  /// a single string joined with the
  /// newline character if the input [valueToValidate]
  /// does not pass validation and returns null otherwise.
  String? validate(String valueToValidate);

  /// Returns validation error messages as
  /// a list of strings if the input [valueToValidate]
  /// does not pass validation and returns null otherwise.
  List<String>? validateWithErrorsAsList(String valueToValidate);

  /// Checks if the input is valid based on the validation
  /// rules provided.
  bool check(String valueToValidate);

  /// Adds a rule that will validate that
  /// the input string is a valid
  /// email address.
  HoverValidator validateAsEmail();

  /// Adds a rule that will validate that
  /// the input string is a valid
  /// mobile number.
  HoverValidator validateAsMobileNumber();

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
  HoverValidator addRule(HoverValidationRule validationRule);
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
  List<String>? validateWithErrorsAsList(String valueToValidate) =>
      validate(valueToValidate)?.split("\n");

  @override
  bool check(String valueToValidate) => validate(valueToValidate) == null;

  @override
  String? Function(String?) build() => validate;

  @override
  HoverFluentValidator validateAsEmail() {
    _validationRules.add(EmailValidation());
    return this;
  }

  @override
  HoverFluentValidator addRule(HoverValidationRule validationRule) {
    _validationRules.add(validationRule);
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
  HoverValidator validateAsMobileNumber() {
    _validationRules.add(MobileNumberValidation());
    return this;
  }
}
