import 'package:flutter/widgets.dart';

abstract class HoverRoute extends StatelessWidget {
  String get routeName;
  Widget generateRouteContent(BuildContext context);
}
