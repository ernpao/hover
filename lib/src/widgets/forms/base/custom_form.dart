import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../../buttons/base/custom_button_text.dart';
import '../../buttons/base/custom_raised_button.dart';
import 'custom_form_field.dart';

abstract class CustomForm extends StatefulWidget {
  /// An identifier for the form. Used for debugging only.
  final String formName;

  /// The form title text located at the top of the form.
  final String title;
  final FontWeight titleFontWeight;
  final double titleFontSize;
  final Color titleColor;

  /// The form's subtitle text located below the title.
  final String subtitle;
  final FontWeight subtitleFontWeight;
  final double subtitleFontSize;
  final Color subtitleColor;

  /// Text for the form's submit button.
  final String submitButtonText;
  final double submitButtonTextSize;
  final Color submitButtonColor;
  final Color submitButtonTextColor;
  final double submitButtonCornerRadius;
  final double submitButtonPadding;

  final List<CustomFormField> fields;
  final Function(Map<String, String>) onSubmit;

  CustomForm({
    this.subtitle,
    this.subtitleFontSize = 16.0,
    this.subtitleFontWeight,
    this.subtitleColor,
    @required this.formName,
    @required this.fields,
    @required this.onSubmit,
    @required this.submitButtonText,
    this.submitButtonTextSize = 16.0,
    this.submitButtonTextColor,
    this.submitButtonColor,
    this.submitButtonCornerRadius = 6.0,
    this.submitButtonPadding = 14.0,
    this.title,
    this.titleFontSize = 28.0,
    this.titleColor,
    this.titleFontWeight = FontWeight.w600,
  });

  @override
  State<StatefulWidget> createState() {
    return _CustomFormState();
  }
}

class _CustomFormState extends State<CustomForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final FocusNode _textNode = new FocusNode();

  Map<String, String> getFormData() {
    Map<String, String> data = Map<String, String>();

    for (CustomFormField field in widget.fields) {
      data[field.getName()] = field.value;
    }

    return data;
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: widget.titleFontSize,
        fontWeight: widget.titleFontWeight,
        color: widget.titleColor,
      ),
    );
  }

  Widget _buildSubtitle(String subtitle) {
    return Text(
      subtitle,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: widget.subtitleFontSize,
        fontWeight: widget.subtitleFontWeight,
      ),
    );
  }

  void _submitForm() {
    print("Form '${widget.formName}' was submitted.");
    if (_formKey.currentState.validate()) {
      print("'${widget.formName}' passed the validation rules.");
      widget.onSubmit(getFormData());
    } else {
      print("Form '${widget.formName}' did not pass the validation rules!");
    }
  }

  Widget _buildSubmitButton() {
    return CustomFormSubmitButton(
      color: widget.submitButtonColor,
      text: widget.submitButtonText,
      textColor: widget.submitButtonTextColor,
      textPadding: widget.submitButtonPadding,
      textFontSize: widget.submitButtonTextSize,
      cornerRadius: widget.submitButtonCornerRadius,
      onPressed: _submitForm,
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];

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
    FocusScope.of(context).requestFocus(_textNode);
    return RawKeyboardListener(
      focusNode: _textNode,
      onKey: (event) {
        if (event.runtimeType.toString() == 'RawKeyDownEvent') {
          final key = event.data.logicalKey;
          if (key == LogicalKeyboardKey.enter) {
            _submitForm();
          }
        }
      },
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(
            top: 32.0,
            bottom: 32.0,
            left: 8,
            right: 8,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomFormSubmitButton extends CustomRaisedButton {
  CustomFormSubmitButton({
    @required Function onPressed,
    Color color,
    String text,
    Color textColor,
    double textPadding,
    double textFontSize,
    double cornerRadius,
    double height,
  }) : super(
          color: color,
          onPressed: onPressed,
          child: CustomButtonText(
            text: text,
            textColor: textColor,
            fontSize: textFontSize,
          ),
          textPadding: textPadding,
          cornerRadius: cornerRadius,
          height: height,
        );
}
