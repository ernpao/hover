import 'package:flutter/material.dart';

class HoverRoundImage extends StatelessWidget {
  /// URL of the image to display
  final String imageUrl;

  /// Radius size of the widget
  final double radius;

  /// How to inscribe the image into the space allocated during layout.
  final BoxFit? fit;

  HoverRoundImage({
    required this.imageUrl,
    required this.radius,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: radius,
      width: radius,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius / 2),
        child: Image.network(
          imageUrl,
          height: radius,
          width: radius,
          fit: fit ?? BoxFit.cover,
        ),
      ),
    );
  }
}
