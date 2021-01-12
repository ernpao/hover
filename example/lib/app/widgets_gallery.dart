import 'package:flutter/material.dart';
import 'package:hover/hover.dart';
import 'package:hover/hover_widgets.dart';

class WidgetsGallery extends HoverPage {
  @override
  Widget render(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HoverTitle("HoverSearchBar"),
        HoverSearchBar(
          hintText: "Search",
        ),
        HoverTitle("HoverSlider"),
        HoverSlider(
          slides: [
            HoverImageSlide(
              width: 350,
              height: 275,
              image: Image.network(
                "https://images.pexels.com/photos/1109197/pexels-photo-1109197.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
                fit: BoxFit.cover,
              ),
            ),
            HoverImageSlide(
              width: 350,
              height: 275,
              image: Image.network(
                "https://images.pexels.com/photos/2641886/pexels-photo-2641886.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                fit: BoxFit.cover,
              ),
            ),
            HoverImageSlide(
              width: 350,
              height: 275,
              image: Image.network(
                "https://images.pexels.com/photos/286283/pexels-photo-286283.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        HoverBaseCard(
          padding: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HoverTitle(
                "HoverBaseCard",
                textAlign: TextAlign.left,
              ),
              Column(
                children: [
                  HoverHeading("HoverCallToActionButton"),
                  HoverCallToActionButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    text: "Call Snackbar",
                    onPressed: () {
                      Hover.showPlainSnackBar(
                        context,
                        "This is a sample snackbar",
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  String get routeName => "/widgets";
}
