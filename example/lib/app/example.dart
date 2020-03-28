import 'package:flutter/material.dart';
import 'package:hover/framework/hover_framework.dart';

import 'profile_page.dart';
import 'landing_page.dart';

///
/// This is the sample application. To create an application using the Hover framework, you
/// must extend the HoverApp class and pass arguments to the super() method.
///
class Example extends StatelessWidget {
  final LandingPage initPage = LandingPage();
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
        onPressed: () {},
        child: Icon(
          Icons.menu,
          color: Colors.white,
        )),
  );

  @override
  Widget build(BuildContext context) {
    return HoverApp.create(
      routes: [
        initPage,
        profilePage,
      ],
      theme: ThemeData.light(),
      providers: [],
      globalAppBar: appBar,
      globalDrawer: drawer,
    );
  }
}
