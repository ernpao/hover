import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'hover_page.dart';
import 'hover_global_widgets.dart';
import 'navigation/hover_navigation.dart';

class HoverApp extends StatelessWidget {
  final List<SingleChildWidget> _providers = List();
  final HoverRouter _appNavigationManager;
  final HoverPage _initialPage;
  final ThemeData _appTheme;
  final HoverGlobalWidgets _globalElements = HoverGlobalWidgets();

  factory HoverApp({
    @required List<HoverPage> appPages,
    @required HoverPage initialPage,
    @required ThemeData appTheme,
    List<SingleChildWidget> providers,
    AppBar globalAppBar,
    Drawer globalDrawer,
    SnackBar globalSnackBar,
    Widget globalFloatingActionButton,
  }) {
    HoverRouter appNavigationManager = HoverRouter(appPages: appPages, initialPage: initialPage);
    return HoverApp._(
      appNavigationManager,
      appTheme,
      initialPage,
      topLevelProviders: providers,
      globalAppBar: globalAppBar,
      globalDrawer: globalDrawer,
      globalSnackBar: globalSnackBar,
      globalFloatingActionButton: globalFloatingActionButton,
    );
  }

  HoverApp._(
    this._appNavigationManager,
    this._appTheme,
    this._initialPage, {
    List<SingleChildWidget> topLevelProviders,
    AppBar globalAppBar,
    Drawer globalDrawer,
    SnackBar globalSnackBar,
    Widget globalFloatingActionButton,
  }) {
    _providers.add(HoverRouterProvider(_appNavigationManager));

    _globalElements.appBar = globalAppBar;
    _globalElements.drawer = globalDrawer;
    _globalElements.snackBar = globalSnackBar;
    _globalElements.floatingActionButton = globalFloatingActionButton;
    _providers.add(HoverGlobalWidgetsProvider(_globalElements));

    if (topLevelProviders != null) {
      _providers.addAll(topLevelProviders);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: _providers,
      child: MaterialApp(
        title: _initialPage.title,
        initialRoute: _initialPage.routeName,
        routes: _appNavigationManager.buildRoutes(),
        debugShowCheckedModeBanner: false,
        theme: _appTheme,
      ),
    );
  }
}
