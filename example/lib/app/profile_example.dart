import 'package:flutter/material.dart';
import 'package:hover/hover.dart';
import 'package:hover/hover_widgets.dart';

class ProfileExample extends HoverPage {
  @override
  String get routeName => "/profile";

  @override
  Widget render(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        HoverSearchBar(
          hintText: "Search Bar Example",
          elevation: 4,
          onChanged: (query) {
            print('Query: $query');
          },
        ),
      ],
    );
  }
}
