import 'package:flutter/material.dart';

/// A content slide to display inside a HoverImageSlider widget
class HoverImageSlide extends StatelessWidget {
  /// The title text to display.
  final Widget title;

  /// The content to display
  final Image image;

  final double width;

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
  /// HoverImageSlides to display.
  final List<Widget> slides;

  final double slideBorderRadius;

  HoverSlider({
    @required this.slides,
    this.slideBorderRadius,
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

      // ListView.builder(
      //     scrollDirection: Axis.horizontal,
      //     itemCount: widget.slides.length,
      //     itemBuilder: (context, i) {
      //       final slide = widget.slides[i];
      //       return slide;
      //     }),
    );
  }
}
