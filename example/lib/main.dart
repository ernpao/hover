import 'package:flutter/material.dart';
import 'package:hover/hover.dart';

import 'app/profile_page.dart';
import 'app/landing_page.dart';

void main() => runApp(HoverExample());

class HoverExample extends StatelessWidget {
  final LandingPage landingPage = LandingPage();
  final ProfilePage profilePage = ProfilePage();

  @override
  Widget build(BuildContext context) {
    return Hover.create(
      routes: [
        landingPage,
        profilePage,
      ],
      themes: {
        "light": ThemeData.light(),
        "dark": ThemeData.dark(),
      },
      providers: [],
      globalAppBarBuilder: buildAppBar,
      globalDrawerBuilder: buildDrawer,
    );
  }

  ///
  /// A Drawer builder function that will be used to
  /// create a globally accessible navigation drawer
  ///
  Drawer buildDrawer(BuildContext context) {
    final items = [
      "Favorites",
      "Recommended",
      "Messages",
      "Settings",
    ];
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Jane Doe"),
            accountEmail: Text("sample@email.com"),
            currentAccountPicture: CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(
                  "https://images.pexels.com/photos/1102341/pexels-photo-1102341.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    onTap: () {
                      // Hover.closeDrawer();
                      Hover.router.navigateTo('/landing', context);
                    },
                    title: Text(items[i]),
                  );
                }),
          ),
        ],
      ),
    );
  }

  ///
  /// An AppBar builder function that will be used
  /// to create an app bar widget that will be
  /// displayed globally
  ///
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Hover Sample App"),
      leading: FlatButton(
        onPressed: () {
          Hover.toggleDrawer(context);
        },
        child: Icon(Icons.menu, color: Colors.white),
      ),
    );
  }
}
