import 'package:flutter/material.dart';

abstract class HoverSnackBarDisplayer {
  void showSnackBar(BuildContext context, Widget content, {Duration duration});
  void showPlainSnackBar(BuildContext context, String message, {Duration duration});
}
