import 'package:flutter/material.dart';

abstract class SnackBarDisplayer extends StatelessWidget {
  static const Duration snackBarDuration = Duration(seconds: 2);

  final GlobalKey<ScaffoldState> scaffoldKey;
  SnackBarDisplayer(
    this.scaffoldKey,
  );

  void showSnackBar(
    String message, {
    Duration duration: snackBarDuration,
  }) {
    this.scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text(message),
            duration: duration,
          ),
        );
  }
}
