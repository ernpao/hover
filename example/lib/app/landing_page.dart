import 'package:flutter/material.dart';
import 'package:hover/framework/core/hover_page.dart';

class LandingPage extends HoverPage {
  @override
  Widget buildContent(BuildContext context) {
    return Container(
      child: Text("This is the landing page"),
    );
  }

  @override
  String get routeName => "landing_page";
}
