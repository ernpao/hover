import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../buttons/hover_call_to_action_button.dart';
import 'custom_form_field.dart';
import 'custom_form_view_state.dart';

abstract class CustomForm extends StatefulWidget {
  /// An identifier for the form. Used for debugging only.
  final String? formName;

  /// The form title text located at the top of the form.
  final String? title;
  final FontWeight? titleFontWeight;
  final double? titleFontSize;
  final Color? titleColor;
  final TextStyle? titleStyle;

  /// The form's subtitle text located below the title.
  final String? subtitle;
  final FontWeight? subtitleFontWeight;
  final double? subtitleFontSize;
  final Color? subtitleColor;

  /// Text for the form's submit button.
  final String? submitButtonText;
  final double? submitButtonTextSize;
  final Color? submitButtonColor;
  final Color? submitButtonTextColor;
  final double? submitButtonCornerRadius;
  final double? submitButtonVerticalPadding;
  final double? submitButtonHorizontalPadding;

  final List<CustomFormField> fields;
  final Function(Map<String, String>) onSubmit;

  final List<Widget>? children;
  final bool enabled;

  CustomForm({
    this.subtitle,
    this.subtitleFontSize,
    this.subtitleFontWeight,
    this.subtitleColor,
    required this.formName,
    required this.fields,
    required this.onSubmit,
    required this.submitButtonText,
    this.submitButtonTextSize,
    this.submitButtonTextColor,
    this.submitButtonColor,
    this.submitButtonCornerRadius,
    this.submitButtonHorizontalPadding,
    this.submitButtonVerticalPadding,
    this.title,
    this.titleFontSize,
    this.titleColor,
    this.titleFontWeight,
    this.titleStyle,
    this.children,
    this.enabled = true,
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
      data[field.name] = field.value;
    }

    return data;
  }

  Widget _buildTitle(String? title) {
    if (title == null) {
      return SizedBox.shrink();
    }
    return Text(
      title,
      textAlign: TextAlign.center,
      style: widget.titleStyle ??
          TextStyle(
            fontSize: widget.titleFontSize ?? 28.0,
            fontWeight: widget.titleFontWeight ?? FontWeight.w600,
            color: widget.titleColor,
          ),
    );
  }

  Widget _buildSubtitle(String? subtitle) {
    return Text(
      subtitle!,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: widget.subtitleFontSize,
        fontWeight: widget.subtitleFontWeight,
      ),
    );
  }

  void _submitForm() {
    final formName = widget.formName ?? "CustomForm";
    print("Form '$formName' was submitted.");
    if (_formKey.currentState!.validate()) {
      print("'$formName' passed the validation rules.");
      widget.onSubmit(getFormData());
    } else {
      print("Form '$formName' did not pass the validation rules!");
    }
  }

  Widget _buildSubmitButton() {
    return HoverCallToActionButton(
      color: widget.submitButtonColor,
      text: widget.submitButtonText ?? "Submit",
      textColor: widget.submitButtonTextColor,
      horizontalPadding: widget.submitButtonHorizontalPadding,
      verticalPadding: widget.submitButtonVerticalPadding,
      cornerRadius: widget.submitButtonCornerRadius,
      onPressed: _submitForm,
      enabled: widget.enabled,
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];

    if (widget.title != null) {
      children.add(_buildTitle(widget.title));
    }

    if (widget.subtitle != null) {
      children.add(SizedBox(height: 12.0)); //spacer above the subtitle
      children.add(_buildSubtitle(widget.subtitle));
    }

    //spacer between the title/subtitle and fields
    children.add(SizedBox(height: 18.0));

    children.addAll(widget.fields);

    //spacer between the form fields and the submit button
    children.add(SizedBox(height: 24.0));

    Widget submitButton = _buildSubmitButton();
    children.add(submitButton);
    FocusScope.of(context).requestFocus(_textNode);
    Widget form = RawKeyboardListener(
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
              children: children..addAll(widget.children ?? []),
            ),
          ),
        ),
      ),
    );
    form = kIsWeb ? SizedBox(width: 450, child: form) : form;

    return Provider(
      create: (_) => CustomFormViewState(enabled: widget.enabled),
      child: form,
    );
  }
}
