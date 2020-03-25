import 'package:hover/widgets/forms/validation/rules/email_validation_rule.dart';
import 'package:hover/widgets/forms/validation/rules/input_length_rule.dart';
import 'package:hover/widgets/forms/validation/rules/password_confirmation_rule.dart';
import 'package:hover/widgets/forms/validation/rules/required_field_rule.dart';
import 'package:hover/widgets/forms/validation/rules/validation_rule.dart';

abstract class FluentFormValidationBase {
  get getValidator;
  String validate(String valueToValidate);
  FluentFormValidationBase validateAsEmail();
  FluentFormValidationBase validateAsPassword(int passwordMinLength);
  FluentFormValidationBase validateAsPasswordConfirmation(String passwordConfirmation);
  FluentFormValidationBase validateAsRequired();
}

class FluentFormValidation implements FluentFormValidationBase {
  List<ValidationRule> _validationRules = List<ValidationRule>();

  String validate(String valueToValidate) {
    String result;

    for (ValidationRule rule in _validationRules) {
      String validationMessage = rule.validate(valueToValidate);
      if (validationMessage != null && validationMessage.isNotEmpty) {
        result = validationMessage;
      }
    }

    return result;
  }

  @override
  FluentFormValidationBase validateAsEmail() {
    _validationRules.add(EmailValidationRule());
    return this;
  }

  @override
  FluentFormValidationBase validateAsPassword(int passwordMinLength) {
    _validationRules.add(MinLengthRule(passwordMinLength));
    return this;
  }

  @override
  FluentFormValidationBase validateAsRequired() {
    _validationRules.add(RequiredFieldValidationRule());
    return this;
  }

  @override
  FluentFormValidationBase validateAsPasswordConfirmation(String passwordConfirmation) {
    _validationRules.add(PasswordConfirmationRule(passwordConfirmation));
    return this;
  }

  @override
  get getValidator => validate;
}
