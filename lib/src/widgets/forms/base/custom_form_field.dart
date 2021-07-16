import 'package:flutter/material.dart';

abstract class CustomFormField extends StatefulWidget {
  final String name;
  final String label;
  final String? initialValue;

  /// A function that returns an error message string
  /// to display if the input [valueToValidate] not pass a validation
  /// test and returns null otherwise.
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? icon;
  final Widget? suffix;
  final Map<String, String> _fieldData = Map();
  final GlobalKey<FormFieldState> _fieldKey = GlobalKey();

  CustomFormField({
    required this.name,
    required this.label,
    this.initialValue,
    this.validator,
    this.keyboardType,
    this.obscureText: false,
    this.icon,
    this.suffix,
  }) {
    _fieldData[name] = initialValue ?? "";
  }

  GlobalKey<FormFieldState> getFieldKey() {
    return _fieldKey;
  }

  String get value => _fieldData[name]!;

  String getName() {
    return name;
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
    _obscureText = widget.obscureText!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: TextFormField(
          key: widget._fieldKey,
          validator: widget.validator ?? (_) => null,
          obscureText: _obscureText,
          keyboardType: widget.keyboardType,
          initialValue: widget.initialValue,
          onChanged: (value) => widget._fieldData[widget.name] = value,
          decoration: InputDecoration(
            labelText: widget.label,
            icon: (widget.icon != null) ? widget.icon : SizedBox.shrink(),
            suffix: _buildSuffix(),
            errorStyle: TextStyle(
              height: 1.75,
              color: Theme.of(context).errorColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget? _buildSuffix() {
    if (widget.obscureText!) {
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
