abstract class HoverValidationRule {
  /// A function that returns an error message string
  /// to display if the input [valueToValidate] not pass a validation
  /// test and returns null otherwise.
  String? validate(String valueToValidate);
}
