import 'package:example/app/mobile_responsiveness_example.dart';
import 'package:example/app/widgets_gallery.dart';
import 'package:flutter/material.dart';
import 'package:hover/hover.dart';

import 'app/profile_example.dart';
import 'app/login_form_example.dart';

void main() => runApp(HoverExample());

class HoverExample extends StatelessWidget {
  final MobileResponsivenessExample mobileResponsivenessExample =
      MobileResponsivenessExample();
  final ProfileExample profilePage = ProfileExample();
  final LoginFormExample loginFormExample = LoginFormExample();
  final WidgetsGallery widgetsGallery = WidgetsGallery();

  @override
  Widget build(BuildContext context) {
    return Hover.create(
      routes: [
        widgetsGallery,
        profilePage,
        loginFormExample,
        mobileResponsivenessExample,
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
    final items = {
      "Login": loginFormExample,
      "Profile": profilePage,
      "Hover Widgets": widgetsGallery,
      "Mobile Responsive Example": mobileResponsivenessExample,
    };
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
                      Hover.router.navigateTo(
                        items.values.elementAt(i).routeName,
                        context,
                      );
                    },
                    title: Text(items.keys.elementAt(i)),
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
