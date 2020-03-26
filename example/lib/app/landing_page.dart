import 'package:flutter/material.dart';
import 'package:hover/framework/core/hover_page.dart';

class LandingPage extends HoverPage {
  @override
  AppBar buildAppBar(BuildContext context, ScaffoldState scaffoldState) {
    // TODO: implement buildAppBar
    return null;
  }

  @override
  Widget buildContent(BuildContext context, ScaffoldState scaffoldState) {
    // TODO: implement buildContent
    return Container(
      child: Text("This is the landing page"),
    );
  }

  @override
  Drawer buildDrawer(BuildContext context, ScaffoldState scaffoldState) {
    // TODO: implement buildDrawer
    return null;
  }

  @override
  Widget buildFloatingActionButton(BuildContext context, ScaffoldState scaffoldState) {
    // TODO: implement buildFloatingActionButton
    return null;
  }

  @override
  SnackBar buildSnackBar(BuildContext context, ScaffoldState scaffoldState) {
    // TODO: implement buildSnackBar
    return null;
  }

  @override
  // TODO: implement routeName
  String get routeName => "landing_page";
}
