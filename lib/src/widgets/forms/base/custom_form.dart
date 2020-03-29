import 'package:flutter/widgets.dart';
import '../../buttons/base/custom_button_text.dart';
import '../../buttons/base/custom_raised_button.dart';
import 'custom_form_field.dart';

abstract class CustomForm extends StatefulWidget {
  CustomForm({
    this.title,
    this.subtitle,
    @required this.formName,
    @required this.fields,
    @required this.onSubmit,
    @required this.submitText,
    this.submitTextColor,
    this.submitColor,
  });

  final String formName;
  final String title;
  final String subtitle;
  final String submitText;
  final Color submitColor;
  final Color submitTextColor;
  final List<CustomFormField> fields;
  final Future<String> Function(Map<String, String>) onSubmit;

  @override
  State<StatefulWidget> createState() {
    return _CustomFormState();
  }
}

class _CustomFormState extends State<CustomForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  Map<String, String> getFormData() {
    Map<String, String> data = Map<String, String>();

    for (CustomFormField field in widget.fields) {
      data[field.getName()] = field.getValue();
    }

    return data;
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildSubtitle(String subtitle) {
    return Text(
      subtitle,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16.0,
      ),
    );
  }

  Widget _buildSubmitButton() {
    return CustomFormSubmitButton(
      // name: "Submit Button for ${widget.formName}",
      color: widget.submitColor,
      submitText: widget.submitText,
      submitTextColor: widget.submitTextColor,
      onPressed: () {
        if (_formKey.currentState.validate()) {
          widget.onSubmit(getFormData()).then((message) {
            print("Form passed the validation rules. Result message: $message");
            return "${widget.formName} was submitted.";
          });
        } else {
          print("Form did not pass the validation rules!");
          print("Failed to submit form: ${widget.formName}");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = List<Widget>();

    if (widget.title != null) {
      Widget titleWidget = _buildTitle(widget.title);
      children.add(titleWidget);
    }

    if (widget.subtitle != null) {
      Widget subtitleWidget = _buildSubtitle(widget.subtitle);
      children.add(SizedBox(height: 12.0)); //spacer below the subtitle
      children.add(subtitleWidget);
    }

    children.addAll(widget.fields);

    //spacer between the form fields and the submit button
    children.add(SizedBox(height: 24.0));

    Widget submitButton = _buildSubmitButton();
    children.add(submitButton);

    return Container(
      child: Padding(
        padding: EdgeInsets.only(
          top: 32.0,
          bottom: 32.0,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children,
          ),
        ),
      ),
    );
  }
}

class CustomFormSubmitButton extends CustomRaisedButton {
  CustomFormSubmitButton({
    @required VoidCallback onPressed,
    Color color,
    String submitText,
    Color submitTextColor,
  }) : super(
          color: color,
          onPressed: onPressed,
          child: CustomButtonText(
            text: submitText,
            textColor: submitTextColor,
          ),
        );
}
