import 'package:flutter/material.dart';

class HoverBaseCard extends StatelessWidget {
  final Widget child;
  final double elevation;
  final double borderRadius;
  final Color color;
  final double leftMargin;
  final double topMargin;
  final double rightMargin;
  final double bottomMargin;
  final double leftPadding;
  final double topPadding;
  final double rightPadding;
  final double bottomPadding;

  HoverBaseCard({
    this.child = const SizedBox.shrink(),
    this.elevation = 2.0,
    this.borderRadius = 24.0,
    this.color: Colors.white,
    this.leftMargin = 12,
    this.topMargin = 12,
    this.rightMargin = 12,
    this.bottomMargin = 12,
    this.leftPadding = 16,
    this.topPadding = 16,
    this.bottomPadding = 16,
    this.rightPadding = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      margin: EdgeInsets.only(
        top: topMargin,
        left: leftMargin,
        right: rightMargin,
        bottom: bottomMargin,
      ),
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: leftPadding,
          top: topPadding,
          right: rightPadding,
          bottom: bottomPadding,
        ),
        child: child,
      ),
    );
  }
}
