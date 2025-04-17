import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'custom_form_view_state.dart';

abstract class CustomFormField extends StatefulWidget {
  final String name;
  final String label;
  final TextEditingController controller;

  /// A function that returns an error message string
  /// to display if the input [valueToValidate] not pass a validation
  /// test and returns null otherwise.
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Widget? icon;
  final Widget? suffix;
  final bool obscureText;

  CustomFormField({
    required this.name,
    required this.label,
    required this.controller,
    this.icon,
    this.keyboardType,
    this.obscureText = false,
    this.suffix,
    this.validator,
  });

  String get value {
    return controller.text;
  }

  @override
  State<StatefulWidget> createState() {
    return _CustomFormFieldState();
  }
}

class _CustomFormFieldState extends State<CustomFormField> {
  late bool _obscureText;

  @override
  void initState() {
    _obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formState = Provider.of<CustomFormViewState>(context);
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: TextFormField(
          controller: widget.controller,
          validator: widget.validator ?? (_) => null,
          obscureText: _obscureText,
          keyboardType: widget.keyboardType,
          enabled: formState.enabled,
          decoration: InputDecoration(
            labelText: widget.label,
            icon: widget.icon ?? SizedBox.shrink(),
            suffix: _buildSuffix(),
            errorStyle: TextStyle(
              height: 1.75,
              // color: Theme.of(context).errorColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget? _buildSuffix() {
    if (widget.obscureText) {
      IconData iconData = Icons.visibility_off;
      if (_obscureText) {
        iconData = Icons.visibility;
      }
      return IconButton(
        icon: Icon(iconData),
        onPressed: () => setState(() {
          _obscureText = !_obscureText;
        }),
      );
    }
    return (widget.suffix != null) ? widget.suffix : SizedBox.shrink();
  }
}
