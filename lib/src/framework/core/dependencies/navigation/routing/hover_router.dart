import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'hover_route.dart';

/// An interface for routing and navigation.
abstract class HoverNavigation {
  Future navigateToInitialPage(BuildContext context);
  Future navigateTo(String route, BuildContext context, {bool push: false});
  Future<void> pop(BuildContext context);
}

abstract class HoverRoutingManager implements HoverNavigation {
  Map<String, Widget Function(BuildContext)> buildRoutes();
  HoverRoute get initialRoute;
  HoverRoute get currentRoute;
  List<HoverRoute> get routes;
  bool canPop(BuildContext context);
}

class HoverRouter implements HoverRoutingManager {
  final List<HoverRoute> routes;
  HoverRoute _currentRoute;

  @override
  HoverRoute get initialRoute => routes[0];

  @override
  HoverRoute get currentRoute => _currentRoute;

  HoverRouter({
    @required this.routes,
  }) {
    _currentRoute = initialRoute;
  }

  @override
  bool canPop(BuildContext context) {
    return Navigator.canPop(context);
  }

  @override
  Future navigateToInitialPage(BuildContext context) async {
    return _navigate(context, initialRoute.routeName);
  }

  @override
  Future navigateTo(String route, BuildContext context, {bool push: false}) async {
    _navigate(context, route, usePush: push);
  }

  Future _navigate(BuildContext context, String routeName, {bool usePush: false}) async {
    routes.forEach((page) {
      if (page.routeName == routeName) {
        _currentRoute = page;
        if (usePush) {
          return Navigator.pushNamed(context, page.routeName);
        } else {
          return Navigator.popAndPushNamed(context, page.routeName);
        }
      }
      return null;
    });
  }

  @override
  Future<void> pop(BuildContext context) async {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  @override
  Map<String, Widget Function(BuildContext)> buildRoutes() {
    final Map<String, Widget Function(BuildContext)> _routes = Map();

    for (HoverRoute page in routes) {
      _routes[page.routeName] = (context) {
        final regenerate = page.regenerate(context);
        return regenerate != null ? regenerate : page;
      };
    }
    return _routes;
  }
}

class HoverRouterProvider extends Provider<HoverRoutingManager> {
  HoverRouterProvider(HoverRoutingManager appNavigationManager) : super(create: (_) => appNavigationManager);
}
