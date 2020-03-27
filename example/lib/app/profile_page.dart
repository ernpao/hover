import 'package:flutter/material.dart';
import 'package:hover/framework/core/hover_page.dart';
import 'package:hover/widgets/hover_widgets.dart';

class ProfilePage extends HoverPage {
  @override
  Widget buildContent(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text("This is the profile page"),
          CallToActionButton(
            text: "Return to landing page",
            onPressed: () {
              popNavigation(context);
              showSnackBar(context, "Returning to the previous screen");
            },
          ),
        ],
      ),
    );
  }

  @override
  String get routeName => "profile_page";
}
