import 'package:flutter/material.dart';

enum HoverResponsiveState {
  desktop,
  tablet,
  phone,
}

class HoverResponsiveBuilder extends StatelessWidget {
  /// The screen width at which the view for tablets is rendered.
  final int breakpointForTablets;

  /// The screen width at which the view for mobile phones is rendered.
  final int breakpointForPhones;

  /// The widgets to render inside this grid.
  final List<Widget> children;

  HoverResponsiveBuilder({
    this.breakpointForPhones: 575,
    this.breakpointForTablets: 768,
    this.children = const [],
    required this.builder,
  }) : assert(breakpointForTablets > breakpointForPhones);

  final Widget Function(BuildContext context, HoverResponsiveState state,
      List<Widget> children) builder;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    if (screenWidth > breakpointForTablets) {
      // Render desktop view
      return builder(context, HoverResponsiveState.desktop, children);
    } else if (screenWidth > breakpointForPhones &&
        screenWidth <= breakpointForTablets) {
      // Render tablet view
      return builder(context, HoverResponsiveState.tablet, children);
    } else {
      // Render phone view
      return builder(context, HoverResponsiveState.phone, children);
    }
  }
}
