import 'package:flutter/material.dart';
import 'hover_circle_button.dart';

class HoverCircleIconButton extends HoverCircleButton {
  HoverCircleIconButton({
    required IconData iconData,
    Function()? onTap,
    double? size,
    double? iconSize,
    Color? color,
    Color? iconColor,
    double? elevation,
  }) : super(
          size: size,
          color: color,
          elevation: elevation,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(iconData, size: iconSize, color: iconColor),
          ),
        );
}
