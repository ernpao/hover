import 'package:flutter/widgets.dart';

abstract class HoverRoute extends StatelessWidget {
  String get routeName;
  Widget regenerate(BuildContext context);
}
