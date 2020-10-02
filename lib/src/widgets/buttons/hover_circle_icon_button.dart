import 'package:flutter/material.dart';

class HoverCircleIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final double size;
  final Color color;
  final Color iconColor;
  final IconData iconData;
  HoverCircleIconButton({
    @required this.onTap,
    @required this.size,
    @required this.color,
    @required this.iconColor,
    @required this.iconData,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: SizedBox(
        height: size,
        width: size,
        child: Card(
          color: color,
          shape: CircleBorder(),
          child: Icon(
            iconData,
            size: size / 2,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
