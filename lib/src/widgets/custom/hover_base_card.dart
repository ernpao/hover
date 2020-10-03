import 'package:flutter/material.dart';

class HoverBaseCard extends StatelessWidget {
  final Widget child;
  final double elevation;
  final double borderRadius;
  final Color color;

  HoverBaseCard({
    this.child: const SizedBox.shrink(),
    this.elevation: 2.0,
    this.borderRadius: 24.0,
    this.color: Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      margin: EdgeInsets.all(12),
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: child,
      ),
    );
  }
}
