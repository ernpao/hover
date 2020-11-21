import 'package:flutter/material.dart';
import 'package:hover/src/framework/helpers/hover_bottom_sheet_helper.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../hover.dart';
import 'core/dependencies/theme/hover_theme.dart';
import 'core/dependencies/navigation/routing/hover_router.dart';
import 'core/dependencies/global_widgets/hover_global_widgets.dart';

import 'helpers/hover_drawer_helper.dart';
import 'helpers/hover_snackbar_helper.dart';
import 'helpers/hover_dimensions_helper.dart';
import 'helpers/hover_shared_preferences_helper.dart';

class Hover extends StatelessWidget {
  static Hover _instance;
  static final List<SingleChildWidget> _providers = List();

  // Routing
  static HoverRoutingManager _router;
  static HoverRoutingManager get router => _router;

  // Drawer
  static bool isDrawerOpen(BuildContext context) =>
      HoverDrawerHelper.isDrawerOpen(context);
  static bool hasDrawer(BuildContext context) =>
      HoverDrawerHelper.hasDrawer(context);
  static void openDrawer(BuildContext context) =>
      HoverDrawerHelper.openDrawer(context);
  static void closeDrawer(BuildContext context) =>
      HoverDrawerHelper.closeDrawer(context);
  static void toggleDrawer(BuildContext context) =>
      HoverDrawerHelper.toggleDrawer(context);

  // Dimensions
  static double getScreenWidth(BuildContext context) =>
      HoverDimensionsHelper.getScreenWidth(context);
  static double getScreenHeight(BuildContext context) =>
      HoverDimensionsHelper.getScreenHeight(context);
  static double getScreenWidthWithScale(BuildContext context, double scale) =>
      getScreenWidth(context) * scale;
  static double getScreenHeightWithScale(BuildContext context, double scale) =>
      getScreenHeight(context) * scale;

  // Theme
  static HoverThemeData _themeData;
  static Future<String> getCurrentThemeName() =>
      _themeData.getCurrentThemeName();
  static void setThemeByName(String themeName) =>
      _themeData.setThemeByName(themeName);

  /// Save key-value pair to shared preferences.
  static Future<bool> saveSetting(String key, String value) =>
      HoverSharedPreferencesHelper.saveSetting(key, value);

  /// Load a value from shared preferences referenced by a key.
  static Future<String> loadSetting(String key) =>
      HoverSharedPreferencesHelper.loadSetting(key);

  /// Helper method for displaying a snackbar widget
  static void showSnackBar(BuildContext context, SnackBar snackBar) {
    HoverSnackBarHelper.showSnackBar(context, snackBar);
  }

  /// Helper method for displaying a simple snackbar
  static void showPlainSnackBar(
    BuildContext context,
    String message, {
    Duration duration: HoverSnackBarHelper.defaultSnackBarDuration,
  }) {
    HoverSnackBarHelper.showPlainSnackBar(context, message, duration: duration);
  }

  /// Helper method for displaying the bottom sheet
  static void showBottomSheet(
    BuildContext context,
    Widget Function(BuildContext) builder,
  ) {
    HoverBottomSheetHelper.showBottomDrawer(context, builder);
  }

  ///
  /// Create an app with Hover. This method
  /// returns a stateless widget that contains a
  /// MaterialApp nested inside a MultiProvider.
  ///
  static Hover create({
    @required List<HoverPage> routes,
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
    @required List<HoverPage> routes,
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
