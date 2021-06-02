import 'package:flutter/material.dart';

abstract class CustomRaisedButton extends StatelessWidget {
  CustomRaisedButton({
    @required this.child,
    @required this.onPressed,
    @required this.color,
    this.cornerRadius = 6.0,
    this.height = 40.0,
    this.width,
    this.textPadding = 4.0,
  });

  final Widget child;
  final Color color;
  final double cornerRadius;
  final double height;
  final double width;
  final Function onPressed;
  final double textPadding;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: SizedBox(
        height: height,
        width: width,
        child: Center(child: child),
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.resolveWith(
          (states) => EdgeInsets.all(textPadding ?? 4.0),
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) => color,
        ),
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(cornerRadius ?? 6.0)),
          ),
        ),
      ),
      onPressed: onPressed ?? () {},
    );
  }
}
