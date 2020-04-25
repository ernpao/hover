import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

// Global components that will be reused throughout the app.
// User provider to pass the global elements to HoverPage widgets.
class HoverGlobalWidgets {
  HoverGlobalWidgets();
  Widget appBar;
  Widget drawer;
  Widget snackBar;
  Widget floatingActionButton;
}

class HoverGlobalWidgetsProvider extends Provider<HoverGlobalWidgets> {
  HoverGlobalWidgetsProvider(HoverGlobalWidgets globalElements)
      : super(create: (_) => globalElements);
}
