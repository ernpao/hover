import 'package:flutter/material.dart';
import 'package:hover/hover.dart';
import 'package:hover/widgets/hover_widgets.dart';

import 'landing_page.dart';

class ProfilePage extends HoverPage {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text("This is the profile page"),
          CallToActionButton(
            text: "Return to landing page",
            onPressed: () {
              goToPage<LandingPage>(context, sbMessageOnNavigate: "Returning to the previous screen!");
            },
          ),
        ],
      ),
    );
  }

  @override
  String get routeName => "/profile";
}
