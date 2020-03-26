import 'package:flutter/material.dart';

abstract class HoverRoute extends StatelessWidget {
  String get routeName;
  GlobalKey<ScaffoldState> get scaffoldKey;
}
