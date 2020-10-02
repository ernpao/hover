import 'package:flutter/material.dart';

class HoverSquareImage extends StatelessWidget {
  final String imageUrl;
  final double size;
  final BoxFit fit;
  HoverSquareImage({
    @required this.imageUrl,
    @required this.size,
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
  final String imageUrl;
  final double size;
  final double borderRadius;
  HoverSquareImageCard({
    @required this.imageUrl,
    @required this.size,
    this.borderRadius: 0,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: HoverSquareImage(
        imageUrl: imageUrl,
        size: size,
      ),
    );
  }
}
