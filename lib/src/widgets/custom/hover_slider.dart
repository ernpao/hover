import 'package:flutter/material.dart';

/// A widget to display inside a HoverImageSlider
class HoverImageSlide extends StatelessWidget {
  /// The positioned widgets to display on top of the [image].
  final List<Positioned> positionedChildren;

  /// The Image widget to display.
  final Image image;

  /// The width of the slide.
  final double width;

  /// The height of the slide.
  final double height;

  final double cornerRadius;
  final double padding;

  final Function onImageTapped;

  HoverImageSlide({
    this.positionedChildren,
    @required this.image,
    @required this.width,
    @required this.height,
    this.cornerRadius = 24,
    this.padding = 8,
    this.onImageTapped,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    children.add(GestureDetector(
      onTap: onImageTapped?.call,
      child: Container(
        child: image,
        width: width - (2 * padding),
        height: height - (2 * padding),
      ),
    ));

    children.addAll(positionedChildren ?? []);

    return Container(
      padding: EdgeInsets.all(padding),
      child: Material(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(cornerRadius),
        child: Stack(
          clipBehavior: Clip.antiAlias,
          alignment: Alignment.center,
          children: children,
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
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    // _controller.addListener(() {
    //   print("Hover Slider Offset: ${_controller.offset}");
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: SingleChildScrollView(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        child: Row(
          children: widget.slides,
        ),
      ),
    );
  }
}
