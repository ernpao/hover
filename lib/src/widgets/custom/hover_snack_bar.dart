import 'package:flutter/material.dart';

import '../../framework/helpers/hover_snackbar_helper.dart';

class HoverSnackBar extends SnackBar {
  /// Default duration for the snack bar is 2 seconds.
  static const Duration defaultDuration =
      HoverSnackBarHelper.defaultSnackBarDuration;

  /// The widget to display inside the snack bar.
  final Widget content;

  /// Sets the how long the snack bar will be displayed.
  /// The default duration is 2 seconds.
  final Duration duration;

  /// Sets the width of the snack bar.
  final double? width;

  HoverSnackBar({
    required this.content,
    this.duration = defaultDuration,
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
