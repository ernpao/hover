import 'package:flutter_test/flutter_test.dart';
import 'package:hover/widgets.dart';

main() {
  test("Hover Fluent Validator - Testing Email Validation", () {
    testValidationRule(
      EmailValidation(),
      validInputs: [
        "email.sample@test.com",
      ],
      invalidInputs: [
        "email.sample@@@test.com",
      ],
    );
  });

  test("Hover Fluent Validator - Testing Mobile Number Validation", () {
    testValidationRule(
      MobileNumberValidation(),
      validInputs: [
        "9999999", // 7 Digits
        "999999999", // 9 Digits
      ],
      invalidInputs: [
        "+63999999", // Country code not allowed
        "+63999999999", // Country code not allowed
      ],
    );
  });

  test("Hover Fluent Validator - Testing Input Length Validation", () {
    testValidationRule(
      InputLengthRule(3, 5),
      validInputs: [
        "Dog", // 3 Chars
        "Cats", // 4 Chars
        "Boats", // 5 Chars
      ],
      invalidInputs: [
        "", // 0 Chars
        "A", // 1 Chars
        "Me", // 2 Chars
        "Orange", // 6 Chars
        "Observe", // 7 Chars
      ],
    );
  });
}

void testValidationRule(
  HoverValidationRule rule, {
  required List<String> validInputs,
  required List<String> invalidInputs,
}) {
  final validator = HoverFluentValidator();
  validator.addRule(rule);
  for (var input in validInputs) {
    print("Testing if $input is valid...");
    bool inputIsValid = validator.check(input);
    assert(inputIsValid);
  }

  for (var input in invalidInputs) {
    print("Testing if $input is invalid...");
    bool inputIsInvalid = !validator.check(input);
    assert(inputIsInvalid);
  }
}
