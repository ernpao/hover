import 'package:flutter/material.dart';
import 'package:hover/hover.dart';

class LandingPage extends HoverSwapper {
  @override
  String get routeName => "/landing";

  @override
  Widget buildBottomNavigation(BuildContext context, int selectedPageIndex, List<Widget> controls) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: controls,
      ),
    );
  }

  @override
  List<HoverSwapperPage> buildPages(BuildContext context) => [page1, page2, page3];
}

final HoverSwapperPage page1 = HoverSwapperPage(
  builder: (context) => Column(
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
          Hover.getCurrentThemeName().then((themeName) {
            if (themeName == 'light') {
              Hover.setThemeByName("dark");
            } else {
              Hover.setThemeByName("light");
            }
          });
        },
      ),
    ],
  ),
  toggleBuilder: (_, isSelected) {
    return Icon(
      Icons.home,
      color: isSelected ? Colors.white : Colors.white60,
    );
  },
);

final HoverSwapperPage page2 = HoverSwapperPage(
  builder: (_) => Container(),
  toggleBuilder: (_, isSelected) {
    return Icon(
      Icons.headset,
      color: isSelected ? Colors.white : Colors.white60,
    );
  },
);

final HoverSwapperPage page3 = HoverSwapperPage(
  builder: (_) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [Text("add")],
  ),
  toggleBuilder: (_, isSelected) {
    return Icon(
      Icons.library_add,
      color: isSelected ? Colors.white : Colors.white60,
    );
  },
);

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
