import 'package:flutter/material.dart';
import '../../framework/helpers/hover_responsive_helper.dart';
import '../../framework/helpers/hover_responsive_state.dart';

class HoverResponsiveBuilder extends StatelessWidget {
  /// The screen width at which the view for tablets is rendered.
  final double breakpointForTablets;

  /// The screen width at which the view for mobile phones is rendered.
  final double breakpointForPhones;

  /// The widgets to render inside this grid.
  final List<Widget> children;

  HoverResponsiveBuilder({
    this.breakpointForPhones = HoverResponsiveHelper.defaultBreakpointForPhones,
    this.breakpointForTablets =
        HoverResponsiveHelper.defaultBreakpointForTablets,
    this.children = const [],
    required this.builder,
  }) : assert(breakpointForTablets > breakpointForPhones);

  final Widget Function(BuildContext context, HoverResponsiveState state,
      List<Widget> children) builder;

  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      HoverResponsiveHelper(context).responsiveState,
      children,
    );
  }
}
