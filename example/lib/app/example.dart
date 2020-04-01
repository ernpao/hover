import 'package:flutter/material.dart';
import 'package:hover/hover.dart';

import 'profile_page.dart';
import 'landing_page.dart';

///
/// This is the sample application. To create an application using the Hover framework, you
/// must extend the HoverApp class and pass arguments to the super() method.
///
class Example extends StatelessWidget {
  final LandingPage landingPage = LandingPage();
  final ProfilePage profilePage = ProfilePage();

  // A global drawer
  final Drawer drawer = Drawer(
    child: Column(
      children: <Widget>[
        Text("Drawer Item 1"),
        Text("Drawer Item 2"),
        Text("Drawer Item 3"),
        Text("Drawer Item 4"),
      ],
    ),
  );

  // A global app bar to display
  final AppBar appBar = AppBar(
    title: Text("Hover Sample App"),
    leading: FlatButton(
        onPressed: () {
          Hover.toggleDrawer();
        },
        child: Icon(
          Icons.menu,
          color: Colors.white,
        )),
  );

  @override
  Widget build(BuildContext context) {
    return Hover.create(
      routes: [
        landingPage,
        profilePage,
      ],
      theme: ThemeData.light(),
      providers: [],
      globalAppBar: appBar,
      globalDrawer: drawer,
    );
  }
}
