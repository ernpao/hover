import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

// Global components that will be reused throughout the app.
// User provider to pass the global elements to HoverPage widgets.
class HoverGlobalWidgets {
  HoverGlobalWidgets({
    this.appBarBuilder,
    this.drawerBuilder,
    this.floatingActionButtonBuilder,
  });
  final Widget Function(BuildContext) appBarBuilder;
  final Widget Function(BuildContext) drawerBuilder;
  final Widget Function(BuildContext) floatingActionButtonBuilder;
}

class HoverGlobalWidgetsProvider extends Provider<HoverGlobalWidgets> {
  HoverGlobalWidgetsProvider(HoverGlobalWidgets globalElements) : super(create: (_) => globalElements);
}
