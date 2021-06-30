import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class CustomRaisedButton extends StatelessWidget {
  CustomRaisedButton({
    required this.child,
    required this.onPressed,
    required this.color,
    this.cornerRadius,
    this.horizontalPadding,
    this.verticalPadding,
    this.margin,
    this.maxWidth,
  });

  final Widget child;
  final Color? color;
  final double? cornerRadius;
  final Function()? onPressed;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? margin;
  final double? maxWidth;

  final double _defaultPadding = 12.0;

  double get _horizontalPadding =>
      (horizontalPadding ?? _defaultPadding) * _paddingScale;
  double get _verticalPadding =>
      (verticalPadding ?? _defaultPadding) * _paddingScale;

  double get _paddingScale => kIsWeb ? 2 : 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(margin ?? 8.0),
      child: SizedBox(
        width: maxWidth,
        child: ElevatedButton(
          child: Center(child: child),
          style: ButtonStyle(
            padding: MaterialStateProperty.resolveWith(
              (states) => EdgeInsets.symmetric(
                horizontal: _horizontalPadding,
                vertical: _verticalPadding,
              ),
            ),
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) => color,
            ),
            shape: MaterialStateProperty.resolveWith(
              (states) => RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(cornerRadius ?? 8.0)),
              ),
            ),
          ),
          onPressed: onPressed?.call,
        ),
      ),
    );
  }
}
