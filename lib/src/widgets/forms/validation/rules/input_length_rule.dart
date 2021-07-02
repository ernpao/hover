import 'hover_validation_rule.dart';

class InputLengthRule implements HoverValidationRule {
  final int max;
  final int min;

  InputLengthRule(this.min, this.max) : assert(min < max);

  @override
  String? validate(String input) {
    int l = input.length;

    if (l < min) {
      return "Please enter a value that is at least $min characters long.";
    }
    if (l > max) {
      return "Please enter a value that does not exceed $max characters in length.";
    }

    return null;
  }
}

class MinLengthRule extends InputLengthRule {
  MinLengthRule(int min) : super(min, 1024);
}

class MaxLengthRule extends InputLengthRule {
  MaxLengthRule(int max) : super(0, max);
}
