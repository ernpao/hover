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
                      Hover.router.goToRoute("/profile", Hover.currentPage.currentState.context);
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

  @override
  Widget buildBottomNavigation(BuildContext context, int currentIndex, List<Widget> controls) {
    print(currentIndex);
    return Container(
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: controls,
      ),
    );
  }
}
