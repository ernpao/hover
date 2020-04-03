import 'package:flutter/material.dart';
import 'package:hover/hover.dart';

class LandingPage extends HoverSwapper {
  LandingPage()
      : super(pages: [
          HoverSwapperPage(
            build: (context) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                HoverTitle("Favorites"),
                _sampleSlider,
                HoverTitle("Recommended For You"),
                _sampleSlider,
                CallToActionButton(
                  text: "Go to Profile",
                  onPressed: () {
                    Hover.router.goToRoute("/profile", context);
                  },
                ),
                CallToActionButton(
                  text: "Toggle Theme",
                  onPressed: () {
                    if (Hover.currentThemeName == "light") {
                      Hover.setThemeByName("dark");
                    } else {
                      Hover.setThemeByName("light");
                    }
                  },
                ),
              ],
            ),
            toggle: Icon(Icons.home),
          ),
          HoverSwapperPage(
            build: (_) => Container(),
            toggle: Icon(Icons.headset),
          ),
          HoverSwapperPage(
            build: (_) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [Text("add")],
            ),
            toggle: Icon(Icons.library_add),
          ),
        ]);

  @override
  String get routeName => "/landing";

  @override
  Widget buildBottomNavigation(BuildContext context, int currentIndex, List<Widget> controls) {
    return Container(
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: controls,
      ),
    );
  }
}

final ImageSlider _sampleSlider = ImageSlider(
  slideWidth: null,
  slideHeight: 180,
  slides: [
    ImageSlide(
      image: Image.network(
        "https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        fit: BoxFit.cover,
      ),
    ),
    ImageSlide(
      title: Text("test"),
      image: Image.network(
        "https://images.pexels.com/photos/277253/pexels-photo-277253.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        fit: BoxFit.cover,
      ),
    ),
    ImageSlide(
      image: Image.network(
        "https://images.pexels.com/photos/958545/pexels-photo-958545.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        fit: BoxFit.cover,
      ),
    ),
    ImageSlide(
      image: Image.network(
        "https://images.pexels.com/photos/5938/food-salad-healthy-lunch.jpg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        fit: BoxFit.cover,
      ),
    )
  ],
);
