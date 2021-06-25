import 'package:flutter/material.dart';

class HoverSquareImage extends StatelessWidget {
  /// URL of the image to display.
  final String imageUrl;

  /// Size of the widget.
  final double size;

  /// How to inscribe the image into the space allocated during layout.
  final BoxFit fit;
  HoverSquareImage({
    required this.imageUrl,
    required this.size,
    this.fit: BoxFit.cover,
  });
  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      height: size,
      width: size,
      fit: fit,
      alignment: Alignment.center,
    );
  }
}

class HoverSquareImageCard extends StatelessWidget {
  /// URL of the image to display.
  final String imageUrl;

  /// Size of the widget.
  final double size;

  /// Sets the corner radius of the widget.
  final double cornerRadius;

  /// The z-coordinate at which to place this card. This controls the size of
  /// the shadow below the card.
  final double elevation;

  HoverSquareImageCard({
    required this.imageUrl,
    required this.size,
    this.cornerRadius: 0,
    this.elevation: 1,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cornerRadius),
      ),
      child: HoverSquareImage(
        imageUrl: imageUrl,
        size: size,
      ),
    );
  }
}
