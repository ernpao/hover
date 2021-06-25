import 'package:flutter/material.dart';

class HoverColumn extends StatelessWidget {
  final Widget child;

  HoverColumn({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return this.child;
  }
}
