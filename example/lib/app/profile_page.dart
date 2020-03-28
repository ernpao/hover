import 'package:flutter/material.dart';
import 'package:hover/hover.dart';

class ProfilePage extends HoverPage {
  @override
  String get routeName => "/profile";

  @override
  Widget buildPageContent(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text("This is the profile page"),
          CallToActionButton(
            text: "Return to landing page",
            onPressed: () {
              goToRoute("/landing", context);
            },
          ),
        ],
      ),
    );
  }
}
