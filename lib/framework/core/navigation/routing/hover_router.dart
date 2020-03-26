import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'hover_route.dart';

abstract class HoverRouting {
  Future goToInitialPage(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey);
  Future goToPage(BuildContext context, String pageRouteName, GlobalKey<ScaffoldState> scaffoldKey, {Object data});
  Future goTo(BuildContext context, HoverRoute page);
  void pop(BuildContext context, {Object returnData});
}

abstract class HoverRoutingManager implements HoverRouting {
  void buildRoutes();
}

class HoverRouter implements HoverRoutingManager {
  final HoverRoute initialPage;
  final List<HoverRoute> appPages;

  HoverRouter({
    @required this.initialPage,
    @required this.appPages,
  });

  void _closeDrawer(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
    if (scaffoldKey.currentState != null &&
        scaffoldKey.currentState.hasDrawer &&
        scaffoldKey.currentState.isDrawerOpen) {
      Navigator.pop(context);
    }
  }

  @override
  Future goToInitialPage(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
    return goToPage(context, initialPage.routeName, scaffoldKey);
  }

  @override
  Future goToPage(
    BuildContext context,
    String pageRouteName,
    GlobalKey<ScaffoldState> scaffoldKey, {
    Object data,
  }) {
    _closeDrawer(context, scaffoldKey);
    return Navigator.popAndPushNamed(context, pageRouteName, arguments: data);
  }

  @override
  Future goTo(BuildContext context, HoverRoute page) {
    _closeDrawer(context, page.scaffoldKey);
    return Navigator.push(context, CupertinoPageRoute(builder: (__) {
      return page;
    }));
  }

  void pop(BuildContext context, {Object returnData}) {
    Navigator.pop(context);
  }

  Map<String, Widget Function(BuildContext)> buildRoutes() {
    final Map<String, Widget Function(BuildContext)> _routes = Map();

    for (HoverRoute page in appPages) {
      _routes[page.routeName] = (_) {
        return page;
      };
    }
    return _routes;
  }
}

class HoverRouterProvider extends Provider<HoverRoutingManager> {
  HoverRouterProvider(HoverRoutingManager appNavigationManager) : super(create: (_) => appNavigationManager);
}
