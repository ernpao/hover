import 'package:flutter/material.dart';
import 'package:hover/hover.dart';

class ProfilePage extends HoverPage {
  @override
  String get routeName => "/profile";

  @override
  Widget render(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("This is the profile page"),
        CallToActionButton(
          text: "Return to landing page",
          onPressed: () {
            navigateTo("/landing", context);
          },
        ),
      ],
    );
  }
}
