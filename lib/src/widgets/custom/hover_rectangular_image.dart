import 'package:flutter/material.dart';

class HoverRectangularImage extends StatelessWidget {
  /// URL of the image to display.
  final String imageUrl;

  /// Width of the widget.
  final double width;

  /// Height of the widget.
  final double height;

  /// How to inscribe the image into the space allocated during layout.
  final BoxFit fit;
  HoverRectangularImage({
    @required this.imageUrl,
    @required this.width,
    @required this.height,
    this.fit: BoxFit.cover,
  });
  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      height: height,
      width: width,
      fit: fit,
      alignment: Alignment.center,
    );
  }
}

class HoverRectangularImageCard extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final double cornerRadius;
  HoverRectangularImageCard({
    @required this.imageUrl,
    @required this.width,
    @required this.height,
    this.cornerRadius: 0,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cornerRadius),
      ),
      child: HoverRectangularImage(
        imageUrl: imageUrl,
        height: height,
        width: width,
      ),
    );
  }
}
