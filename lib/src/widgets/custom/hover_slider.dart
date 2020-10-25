import 'package:flutter/material.dart';

/// A content slide to display inside a HoverImageSlider widget
class HoverImageSlide extends StatelessWidget {
  /// The title text to display.
  final Widget title;

  /// The Image widget to display.
  final Image image;

  /// The width of the slide.
  final double width;

  /// The height of the slide.
  final double height;

  HoverImageSlide({
    this.title,
    @required this.image,
    @required this.width,
    @required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: Material(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          clipBehavior: Clip.antiAlias,
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: width,
              height: height,
              child: image,
            ),
            Positioned(
              bottom: 8,
              left: 8,
              child: title != null ? title : SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

class HoverSlider extends StatefulWidget {
  /// Slides to display.
  final List<Widget> slides;

  HoverSlider({
    @required this.slides,
  });

  @override
  State<StatefulWidget> createState() {
    return _HoverSliderState();
  }
}

class _HoverSliderState extends State<HoverSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: widget.slides,
        ),
      ),
    );
  }
}
