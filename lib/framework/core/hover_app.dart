import 'package:flutter/material.dart';
import 'navigation/hover_navigation.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'hover_page.dart';

class HoverApp extends StatelessWidget {
  final List<SingleChildWidget> _providers = List();
  final HoverRouter _appNavigationManager;
  final HoverPage _initialPage;
  final ThemeData _appTheme;

  factory HoverApp({
    @required List<HoverPage> appPages,
    @required HoverPage initialPage,
    @required ThemeData appTheme,
    List<SingleChildWidget> providers,
  }) {
    HoverRouter appNavigationManager = HoverRouter(appPages: appPages, initialPage: initialPage);
    return HoverApp._(
      appNavigationManager,
      appTheme,
      initialPage,
      topLevelProviders: providers,
    );
  }

  HoverApp._(
    this._appNavigationManager,
    this._appTheme,
    this._initialPage, {
    List<SingleChildWidget> topLevelProviders,
  }) {
    _providers.add(HoverRouterProvider(_appNavigationManager));
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
