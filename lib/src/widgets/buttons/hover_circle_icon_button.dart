import 'package:flutter/material.dart';

class HoverCircleIconButton extends StatelessWidget {
  HoverCircleIconButton({
    required this.iconData,
    this.color,
    this.onTap,
    this.size,
    this.iconSize,
    this.iconColor,
    this.elevation,
  });

  final IconData iconData;
  final Function()? onTap;
  final double? size;
  final double? iconSize;
  final Color? color;
  final Color? iconColor;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: size,
        width: size,
        child: Card(
          elevation: elevation,
          color: color,
          shape: CircleBorder(),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                iconData,
                size: iconSize,
                color: iconColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
