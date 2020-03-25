import 'package:flutter/material.dart';

abstract class CustomRaisedButton extends StatelessWidget {
  CustomRaisedButton({
    this.child,
    this.color,
    this.borderRadius: 2.0,
    this.height: 40.0,
    this.onPressed,
    this.textPadding: 0,
  }) : assert(
          borderRadius != null,
          child != null,
        );
  final Widget child;
  final Color color;
  final double borderRadius;
  final double height;
  final VoidCallback onPressed;
  final double textPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 2, 0, 8),
      child: SizedBox(
        height: height,
        child: RaisedButton(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: textPadding),
            child: child,
          ),
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
