import 'package:flutter/widgets.dart';

import 'hover_route.dart';

/// An interface for routing and navigation.
abstract class HoverNavigation {
  void navigateTo(
    String route,
    BuildContext context, {
    bool push = false,
  });
  void pop(BuildContext context);
}

abstract class HoverRoutingManager implements HoverNavigation {
  Map<String, Widget Function(BuildContext)> buildRoutes();
  HoverRoute get initialRoute;
  List<HoverRoute>? get routes;
  bool canPop(BuildContext context);
}

class HoverRouter implements HoverRoutingManager {
  final List<HoverRoute> routes;

  @override
  HoverRoute get initialRoute => routes[0];

  HoverRouter({
    required this.routes,
  });

  @override
  bool canPop(BuildContext context) => Navigator.canPop(context);

  @override
  void navigateTo(
    String route,
    BuildContext context, {
    bool push = false,
  }) async {
    return _navigate(context, route, usePush: push);
  }

  void _navigate(
    BuildContext context,
    String routeName, {
    bool usePush = false,
  }) async {
    for (int i = 0; i < routes.length; i++) {
      final route = routes[i];
      if (route.routeName == routeName) {
        if (usePush) {
          Navigator.pushNamed(context, route.routeName);
          return;
        } else {
          Navigator.popAndPushNamed(context, route.routeName);
          return;
        }
      }
    }
    print("Hover Router: Route Name $routeName is invalid!");
  }

  @override
  void pop(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      print('Can\'t pop the navigation stack.');
    }
  }

  @override
  Map<String, Widget Function(BuildContext)> buildRoutes() {
    final Map<String, Widget Function(BuildContext)> _routes = Map();
    for (HoverRoute page in routes) {
      _routes[page.routeName] = (context) => page.generateRouteContent(context);
    }
    return _routes;
  }
}
