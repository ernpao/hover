import 'package:example/app/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:hover/framework/core/hover_page.dart';
import 'package:hover/widgets/hover_widgets.dart';

class LandingPage extends HoverPage {
  @override
  Widget buildContent(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CallToActionButton(
            text: "Go to profile page",
            onPressed: () {
              navigateTo<ProfilePage>(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  String get routeName => "landing_page";
}
