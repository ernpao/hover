import 'package:flutter/material.dart';
import 'package:hover/src/framework/helpers/hover_snackbar_helper.dart';

class HoverSnackBar extends SnackBar {
  static const Duration defaultDuration =
      HoverSnackBarHelper.defaultSnackBarDuration;

  HoverSnackBar({
    @required Widget content,
    Duration duration: defaultDuration,
    double width,
  }) : super(
          duration: duration,
          elevation: 0,
          backgroundColor: Colors.transparent,
          behavior: SnackBarBehavior.floating,
          width: width,
          content: content,
        );
}
