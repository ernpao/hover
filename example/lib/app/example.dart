import 'package:flutter/material.dart';
import 'package:hover/framework/core/hover_app.dart';

import 'profile_page.dart';
import 'landing_page.dart';

///
/// This is the sample application. To create an application using the Hover framework, you
/// must extend the HoverApp class and pass arguments to the super() method.
///
class Example extends StatelessWidget {
  final LandingPage initPage = LandingPage();
  final ProfilePage profilePage = ProfilePage();

  @override
  Widget build(BuildContext context) {
    return HoverApp(
      appPages: [
        initPage,
        profilePage,
      ],
      appTheme: ThemeData.light(),
      providers: [],
    );
  }
}
