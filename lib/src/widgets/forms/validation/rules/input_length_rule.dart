import 'hover_validation_rule.dart';

class InputLengthRule implements HoverValidationRule {
  final int _maxLength;
  final int _minLength;

  InputLengthRule(this._minLength, this._maxLength)
      : assert(_minLength < _maxLength);

  @override
  String validate(String valueToValidate) {
    int length = valueToValidate.length;

    if (length < _minLength) {
      return "Please enter a value that is at least $_minLength characters long";
    }
    if (length > _maxLength) {
      return "Please enter a value that does not exceed $_maxLength characters in lenth.";
    }

    return null;
  }
}

class MinLengthRule extends InputLengthRule {
  MinLengthRule(int minLength) : super(minLength, 1024);
}

class MaxLengthRule extends InputLengthRule {
  MaxLengthRule(int maxLength) : super(0, maxLength);
}
