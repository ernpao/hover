import 'package:flutter/material.dart';

abstract class CustomFormField extends StatefulWidget {
  CustomFormField({
    @required this.name,
    @required this.labelText,
    this.initialValue: "",
    this.validator,
    this.keyboardType,
    this.obscureText: false,
    this.icon,
    this.suffix,
  }) {
    fieldData[name] = initialValue;
  }

  final String name;
  final String labelText;
  final String initialValue;
  final String Function(String) validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget icon;
  final Widget suffix;
  final Map<String, String> fieldData = Map();
  final GlobalKey<FormFieldState> _fieldKey = GlobalKey();

  GlobalKey<FormFieldState> getFieldKey() {
    return _fieldKey;
  }

  String getValue() {
    return fieldData[name];
  }

  String getName() {
    return name;
  }

  @override
  State<StatefulWidget> createState() {
    return _CustomFormFieldState();
  }
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool _obscureText;
  @override
  void initState() {
    _obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: TextFormField(
          key: widget._fieldKey,
          // controller: _fieldController,
          validator: widget.validator,
          obscureText: _obscureText,
          keyboardType: widget.keyboardType,
          initialValue: widget.initialValue,
          onChanged: (value) => widget.fieldData[widget.name] = value,
          decoration: InputDecoration(
            labelText: widget.labelText,
            icon: (widget.icon != null) ? widget.icon : SizedBox.shrink(),
            suffix: _buildSuffix(),
          ),
        ),
      ),
    );
  }

  Widget _buildSuffix() {
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
