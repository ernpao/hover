import 'package:flutter/material.dart';
import 'package:hover/hover.dart';
import 'package:hover/hover_widgets.dart';

class SwapperPage extends HoverSwapper {
  @override
  String get routeName => "/swapper";

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
  builder: (context) => SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        HoverTitle("Favorites"),
        _sampleSlider,
        HoverTitle("Recommended For You"),
        _sampleSlider,
        CallToActionButton(
          text: "Return Data Example",
          onPressed: () async {
            final data = await Hover.router.navigateTo("/return", context, push: true);
            print(data);
            if (data != null) {
              Hover.showPlainSnackBar(context, data);
            } else {
              Hover.showPlainSnackBar(context, "No data recieved!");
            }
          },
        ),
        CallToActionButton(
          text: 'Show plain snackbar',
          onPressed: () {
            Hover.showPlainSnackBar(context, "This a test");
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
  ),
  toggleBuilder: (_, isSelected) {
    return Icon(
      Icons.home,
      color: isSelected ? Colors.white : Colors.white60,
    );
  },
);

class Page2Content extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Page2ContentState();
  }
}

class Page2ContentState extends State<Page2Content> {
  final TextEditingController _inputController = new TextEditingController();
  String _text;

  @override
  void initState() {
    super.initState();
    _text = 'Loaded text will be displayed here';
    Hover.loadSetting('hover-test-text').then((value) {
      setState(() {
        _text = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        HoverText('Testing Saved Preferences'),
        TextField(
          controller: _inputController,
          decoration: InputDecoration(labelText: 'Type some text'),
        ),
        CallToActionButton(
          text: 'Save Text',
          onPressed: () {
            Hover.saveSetting('hover-test-text', _inputController.value.text);
          },
        ),
        Text(_text),
        CallToActionButton(
          text: 'Load Text',
          onPressed: () {
            Hover.loadSetting('hover-test-text').then((value) {
              setState(() {
                _text = value;
              });
            });
          },
        ),
      ],
    );
  }
}

final HoverSwapperPage page2 = HoverSwapperPage(
  builder: (_) => Container(child: Page2Content()),
  toggleBuilder: (_, isSelected) {
    return Icon(
      Icons.headset,
      color: isSelected ? Colors.white : Colors.white60,
    );
  },
);

final HoverSwapperPage page3 = HoverSwapperPage(
  builder: (context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text("add"),
      Text("Screen Width: ${Hover.getScreenWidth(context)}"),
      Text("Screen Height: ${Hover.getScreenHeight(context)}"),
    ],
  ),
  toggleBuilder: (_, isSelected) {
    return Icon(Icons.phone_android, color: isSelected ? Colors.white : Colors.white60);
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
