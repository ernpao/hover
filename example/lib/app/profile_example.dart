import 'package:flutter/material.dart';
import 'package:hover/framework.dart';
import 'package:hover/widgets.dart';

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
        HoverCallToActionButton(
          cornerRadius: 24,
          text: "Press Me!",
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
            Hover.showSnackBar(
              context,
              HoverSnackBar(
                width: 250,
                content: HoverBaseCard(
                  color: Colors.blue,
                  child: HoverText(
                    "Hello!",
                    color: Colors.white,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
