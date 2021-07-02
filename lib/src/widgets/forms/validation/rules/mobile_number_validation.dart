import 'hover_validation_rule.dart';

class MobileNumberValidation implements HoverValidationRule {
  @override
  String? validate(String mobileNumber) {
    bool r = HoverValidationRegExp.phoneRegExp.hasMatch(mobileNumber);
    return r ? null : "Please enter a valid mobile number.";
  }
}
