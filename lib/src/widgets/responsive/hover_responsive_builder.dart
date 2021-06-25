import 'package:flutter/material.dart';

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
    required this.tabletViewBuilder,
    required this.phoneViewBuilder,
  }) : assert(breakpointForTablets > breakpointForPhones);

  /// Builder for phone view.
  final Widget Function(BuildContext context, List<Widget> children)
      phoneViewBuilder;

  /// Builder for tablet view.
  final Widget Function(BuildContext context, List<Widget> children)
      tabletViewBuilder;

  /// Builder for desktop view.
  final Widget Function(BuildContext context, List<Widget> children) builder;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    if (screenWidth > breakpointForTablets) {
      // Render desktop view
      return builder(context, children);
    } else if (screenWidth > breakpointForPhones &&
        screenWidth <= breakpointForTablets) {
      // Render tablet view
      return tabletViewBuilder(context, children);
    } else {
      // Render phone view
      return phoneViewBuilder(context, children);
    }
  }
}
