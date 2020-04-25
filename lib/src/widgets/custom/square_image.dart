import 'package:flutter/material.dart';

class SquareImage extends StatelessWidget {
  final String imageUrl;
  final double size;
  final BoxFit fit;
  SquareImage({
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

class SquareImageCard extends StatelessWidget {
  final String imageUrl;
  final double size;
  final double borderRadius;
  SquareImageCard({
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
      child: SquareImage(
        imageUrl: imageUrl,
        size: size,
      ),
    );
  }
}
