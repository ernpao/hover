import 'package:flutter/material.dart';

abstract class HoverRoute extends StatefulWidget {
  String get routeName;
  GlobalKey<ScaffoldState> get scaffoldKey;
}
