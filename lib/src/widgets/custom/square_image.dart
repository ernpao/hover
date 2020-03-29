import 'package:flutter/material.dart';

class SquareImage extends StatelessWidget {
  final String imageUrl;
  final double size;
  SquareImage({
    @required this.imageUrl,
    @required this.size,
  });
  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      height: size,
      width: size,
      fit: BoxFit.cover,
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
