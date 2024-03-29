import 'package:flutter/material.dart';
import 'package:hover/hover.dart';

import 'app/profile_example.dart';
import 'app/forms/login_form_example.dart';
import 'app/mobile_responsiveness_example.dart';
import 'app/forms/sign_up_form_example.dart';
import 'app/view_splitter_example.dart';
import 'app/widgets_gallery.dart';

void main() => runApp(HoverDemo());

class HoverDemo extends StatelessWidget {
  final mobileResponsivenessExample = MobileResponsivenessExample();
  final profilePage = ProfileExample();
  final signInFormExample = LoginFormExample();
  final signUpFormExample = SignUpFormExample();
  final widgetsGallery = WidgetsGallery();
  final viewSplitterExample = ViewSplitterExample();

  @override
  Widget build(BuildContext context) {
    return Hover.create(
      pages: [
        signUpFormExample,
        mobileResponsivenessExample,
        widgetsGallery,
        signInFormExample,
        viewSplitterExample,
        profilePage,
      ],
      themes: [
        HoverThemeData.dark,
        HoverThemeData.light,
      ],
      providers: [],
      appBarBuilder: _buildAppBar,
      drawerBuilder: _buildDrawer,
    );
  }

  ///
  /// A Drawer builder function that will be used to
  /// create a globally accessible navigation drawer
  ///
  Drawer _buildDrawer(BuildContext context) {
    final items = {
      "Login": signInFormExample,
      "Sign Up": signUpFormExample,
      "Profile": profilePage,
      "Hover Widgets": widgetsGallery,
      "Mobile Responsive Example": mobileResponsivenessExample,
      "View Splitter Example": viewSplitterExample,
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
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Hover Demo App"),
      leading: TextButton(
        onPressed: () => Hover.toggleDrawer(context),
        child: Icon(Icons.menu, color: Colors.white),
      ),
    );
  }
}
