import 'package:flutter/material.dart';
import 'package:hover/framework.dart';
import 'package:hover/widgets.dart';

class WidgetsGallery extends HoverPage {
  @override
  Widget render(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HoverTitle("HoverSearchBar"),
          HoverSearchBar(
            hintText: "Search",
            // initialText: "Enter some text!",
            onSubmitted: (query) {
              Hover.showPlainSnackBar(
                  context, "HoverSearchBar User Query: $query");
            },
            onChanged: (query) {
              print("HoverSearchBar User Query: $query");
            },
          ),
          HoverTitle("HoverSlider"),
          HoverSlider(
            slides: [
              HoverImageSlide(
                width: Hover.getScreenWidth(context),
                height: 275,
                image: Image.network(
                  "https://images.pexels.com/photos/2641886/pexels-photo-2641886.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                  fit: BoxFit.cover,
                ),
                positionedChildren: [
                  Positioned(
                      top: 16,
                      right: 16,
                      child:
                          HoverText("This is some text", color: Colors.white)),
                  Positioned(
                    bottom: 16,
                    child: HoverCallToActionButton(
                      text: "CTA Button",
                      onPressed: () => Hover.showPlainSnackBar(
                        context,
                        "Called to action!",
                      ),
                    ),
                  ),
                ],
                onImageTapped: () {
                  Hover.showPlainSnackBar(context, "Slide was tapped!");
                },
              ),
              HoverImageSlide(
                width: Hover.getScreenWidth(context),
                height: 275,
                image: Image.network(
                  "https://images.pexels.com/photos/1109197/pexels-photo-1109197.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
                  fit: BoxFit.cover,
                ),
              ),
              HoverImageSlide(
                width: Hover.getScreenWidth(context),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HoverHeading("HoverCallToActionButton"),
                    HoverCallToActionButton(
                      text: "Call Snackbar",
                      width: 200,
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
      ),
    );
  }

  @override
  String get routeName => "/widgets";
}
