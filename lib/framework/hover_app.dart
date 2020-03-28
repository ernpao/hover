import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'hover_framework.dart';

class HoverApp extends StatelessWidget {
  static final List<SingleChildWidget> _providers = List();
  static HoverRouter _router;
  static ThemeData _theme;
  static final HoverGlobalWidgets _globalElements = HoverGlobalWidgets();

  static HoverApp _instance;
  static HoverApp get instance => _instance;

  static HoverApp create({
    @required List<HoverRoute> routes,
    @required ThemeData theme,
    List<SingleChildWidget> providers,
    AppBar globalAppBar,
    Drawer globalDrawer,
    SnackBar globalSnackBar,
    Widget globalFloatingActionButton,
  }) {
    if (_instance == null) {
      _instance = HoverApp._(
        routes: routes,
        theme: theme,
        providers: providers,
        appBar: globalAppBar,
        drawer: globalDrawer,
        snackBar: globalSnackBar,
        floatingActionButton: globalFloatingActionButton,
      );
    }

    return _instance;
  }

  HoverApp._({
    @required List<HoverRoute> routes,
    @required ThemeData theme,
    List<SingleChildWidget> providers,
    AppBar appBar,
    Drawer drawer,
    SnackBar snackBar,
    Widget floatingActionButton,
  }) {
    _theme = theme;
    _router = HoverRouter(routes: routes);

    _providers.add(HoverRouterProvider(_router));

    _globalElements.appBar = appBar;
    _globalElements.drawer = drawer;
    _globalElements.snackBar = snackBar;
    _globalElements.floatingActionButton = floatingActionButton;
    _providers.add(HoverGlobalWidgetsProvider(_globalElements));

    if (providers != null) {
      _providers.addAll(providers);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: _providers,
      child: MaterialApp(
        initialRoute: _router.routes[0].routeName,
        routes: _router.buildRoutes(),
        debugShowCheckedModeBanner: false,
        theme: _theme,
      ),
    );
  }
}
