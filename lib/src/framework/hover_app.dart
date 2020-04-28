import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'core/hover_page_base.dart';
import 'core/dependencies/theme/hover_theme.dart';
import 'core/dependencies/navigation/routing/hover_route.dart';
import 'core/dependencies/navigation/routing/hover_router.dart';
import 'core/dependencies/helpers/hover_snackbar_helper.dart';
import 'core/dependencies/helpers/hover_shared_preferences_helper.dart';
import 'core/dependencies/global_widgets/hover_global_widgets.dart';

class Hover extends StatelessWidget {
  static Hover _instance;
  static final List<SingleChildWidget> _providers = List();

  // Routing
  static HoverRoutingManager _router;
  static HoverRoutingManager get router => _router;
  static HoverPageBase get currentPage => _router.currentRoute as HoverPageBase;

  // Drawer
  static bool isDrawerOpen(BuildContext context) => currentPage.isDrawerOpen(context);
  static void closeDrawer(BuildContext context) => currentPage.closeDrawer(context);
  static void openDrawer(BuildContext context) => currentPage.openDrawer(context);
  static void toggleDrawer(BuildContext context) => currentPage.toggleDrawer(context);

  // Theme
  static HoverThemeData _themeData;
  static Future<String> getCurrentThemeName() => _themeData.getCurrentThemeName();
  static void setThemeByName(String themeName) => _themeData.setThemeByName(themeName);

  /// Save key-value pair to shared preferences.
  static void saveSetting(String key, String value) => HoverSharedPreferencesHelper.saveSetting(key, value);

  /// Load a value from shared preferences referenced by a key.
  static Future<String> loadSetting(String key) => HoverSharedPreferencesHelper.loadSetting(key);

  static void showSnackBar(
    BuildContext context,
    Widget content, {
    Duration duration: HoverSnackBarHelper.defaultSnackBarDuration,
  }) {
    HoverSnackBarHelper.showSnackBar(context, content, duration: duration);
  }

  static void showPlainSnackBar(
    BuildContext context,
    String message, {
    Duration duration: HoverSnackBarHelper.defaultSnackBarDuration,
  }) {
    HoverSnackBarHelper.showPlainSnackBar(context, message, duration: duration);
  }

  ///
  /// Create an app with Hover. This method
  /// returns a stateless widget that contains a
  /// MaterialApp nested inside a MultiProvider.
  ///
  static Hover create({
    @required List<HoverRoute> routes,
    @required Map<String, ThemeData> themes,
    List<SingleChildWidget> providers,
    Widget Function(BuildContext) globalAppBarBuilder,
    Widget Function(BuildContext) globalDrawerBuilder,
    Widget Function(BuildContext) globalfloatingActionButtonBuilder,
  }) {
    if (_instance == null) {
      _instance = Hover._(
        routes: routes,
        themes: themes,
        providers: providers,
        globalWidgets: HoverGlobalWidgets(
          appBarBuilder: globalAppBarBuilder,
          drawerBuilder: globalDrawerBuilder,
          floatingActionButtonBuilder: globalfloatingActionButtonBuilder,
        ),
      );
    }
    return _instance;
  }

  Hover._({
    @required List<HoverRoute> routes,
    @required Map<String, ThemeData> themes,
    List<SingleChildWidget> providers,
    HoverGlobalWidgets globalWidgets,
  }) {
    _router = HoverRouter(routes: routes);
    _providers.add(HoverRouterProvider(_router));

    _themeData = HoverThemeData(themes: themes);
    _providers.add(HoverThemeProvider(_themeData));

    _providers.add(HoverGlobalWidgetsProvider(globalWidgets));

    if (providers != null) {
      _providers.addAll(providers);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: _providers,
      child: _HoverAppBody(
        themeData: _themeData,
      ),
    );
  }
}

class _HoverAppBody extends StatefulWidget {
  final HoverThemeData themeData;
  _HoverAppBody({
    @required this.themeData,
  });
  @override
  _HoverAppBodyState createState() {
    return _HoverAppBodyState();
  }
}

class _HoverAppBodyState extends State<_HoverAppBody> {
  @override
  void initState() {
    super.initState();
    widget.themeData.loadSavedTheme();
  }

  @override
  Widget build(BuildContext context) {
    final _themeData = Provider.of<HoverThemeData>(context, listen: true);
    final _routingManager = Provider.of<HoverRoutingManager>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _themeData.currentTheme,
      routes: _routingManager.buildRoutes(),
      initialRoute: _routingManager.initialRoute.routeName,
    );
  }
}
