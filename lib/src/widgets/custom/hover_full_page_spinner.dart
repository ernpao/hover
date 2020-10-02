import 'package:flutter/material.dart';

class HoverFullPageSpinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Center(child: CircularProgressIndicator()),
      ],
    );
  }
}
