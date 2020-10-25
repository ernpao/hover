import 'package:flutter/material.dart';
import 'package:hover/src/framework/helpers/hover_snackbar_helper.dart';

class HoverSnackBar extends SnackBar {
  static const Duration defaultDuration =
      HoverSnackBarHelper.defaultSnackBarDuration;

  /// The widget to display inside the snack bar.
  final Widget content;

  /// Sets the how long the snack bar will be displayed.
  final Duration duration;

  /// Sets the width of the widget.
  final double width;

  HoverSnackBar({
    @required this.content,
    this.duration,
    this.width,
  }) : super(
          duration: duration,
          elevation: 0,
          backgroundColor: Colors.transparent,
          behavior: SnackBarBehavior.floating,
          width: width,
          content: content,
        );
}
