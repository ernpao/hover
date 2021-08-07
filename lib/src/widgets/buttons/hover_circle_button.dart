import 'package:flutter/material.dart';

class HoverCircleButton extends StatelessWidget {
  HoverCircleButton({
    this.child,
    this.color,
    this.onTap,
    this.size,
    this.elevation,
  });

  final Widget? child;
  final Function()? onTap;
  final double? size;
  final Color? color;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: size,
        width: size,
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: elevation,
          color: color,
          shape: CircleBorder(),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
