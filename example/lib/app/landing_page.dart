import 'package:flutter/material.dart';
import 'package:hover/hover.dart';

class LandingPage extends HoverSwapper {
  LandingPage()
      : super(pages: [
          HoverSwapperPage(
            content: Container(
              child: Column(
                children: <Widget>[
                  Text("home"),
                  CallToActionButton(
                    text: "Go to Profile",
                    onPressed: () {
                      HoverApp.router.goToRoute("/profile", HoverApp.currentPage.currentState.context);
                    },
                  ),
                ],
              ),
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
