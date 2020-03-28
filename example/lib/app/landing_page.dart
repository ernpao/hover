import 'package:flutter/material.dart';
import 'package:hover/framework/hover_framework.dart';

class LandingPage extends HoverSwapper {
  LandingPage()
      : super(pages: [
          HoverSwapperPage(
            content: Container(
              child: Text("home"),
            ),
            toggle: Icon(Icons.home),
          ),
          HoverSwapperPage(
            content: Container(
              child: Text("headset"),
            ),
            toggle: Icon(Icons.headset),
          ),
          HoverSwapperPage(
            content: Container(
              child: Text("add"),
            ),
            toggle: Icon(Icons.library_add),
          ),
        ]);

  @override
  String get routeName => "/landing";
}
