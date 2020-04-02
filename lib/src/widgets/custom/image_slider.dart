import 'package:flutter/material.dart';

class ImageSlide extends StatelessWidget {
  final Widget title;
  final Image image;

  ImageSlide({
    this.title,
    @required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: Material(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          overflow: Overflow.clip,
          alignment: Alignment.center,
          children: <Widget>[
            Container(
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

class ImageSlider extends StatefulWidget {
  final List<ImageSlide> slides;
  final double slideBorderRadius;
  final double slideHeight;
  final double slideWidth;

  ImageSlider({
    @required this.slides,
    this.slideBorderRadius,
    @required this.slideHeight,
    @required this.slideWidth,
  });

  @override
  State<StatefulWidget> createState() {
    return _ImageSliderState();
  }
}

class _ImageSliderState extends State<ImageSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      height: widget.slideHeight,
      width: widget.slideWidth,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.slides.length,
          itemBuilder: (context, i) {
            final slide = widget.slides[i];
            return slide;
          }),
    );
  }
}
