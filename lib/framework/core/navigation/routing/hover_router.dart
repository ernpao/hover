import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'hover_route.dart';

abstract class HoverRoutingManager {
  Future goToInitialPage(BuildContext context);
  Future goToPage<T>(BuildContext context);
  Future<void> pop(BuildContext context);
  void buildRoutes();
}

class HoverRouter implements HoverRoutingManager {
  final List<HoverRoute> appPages;
  HoverRoute currentPage;
  HoverRoute get initialPage => appPages[0];

  HoverRouter({
    @required this.appPages,
  }) {
    currentPage = initialPage;
  }

  void _closeDrawer(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
    if (scaffoldKey.currentState != null &&
        scaffoldKey.currentState.hasDrawer &&
        scaffoldKey.currentState.isDrawerOpen) {
      Navigator.pop(context);
    }
  }

  @override
  Future goToInitialPage(BuildContext context, {String snackBarMessageOnNavigate}) async {
    return _navigate(context, initialPage);
  }

  @override
  Future goToPage<T>(BuildContext context, {String snackBarMessageOnNavigate}) async {
    appPages.forEach((page) {
      if (page.runtimeType == T) {
        return _navigate(context, page);
      }
      return null;
    });
    return null;
  }

  Future _navigate(BuildContext context, HoverRoute targetPage) async {
    _closeDrawer(context, targetPage.scaffoldKey);
    return Navigator.popAndPushNamed(context, targetPage.routeName);
  }

  Future<void> pop(BuildContext context) async {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
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
