import 'package:flutter/material.dart';

class RectangularImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;
  RectangularImage({
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

class RectangularImageCard extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final double borderRadius;
  RectangularImageCard({
    @required this.imageUrl,
    @required this.width,
    @required this.height,
    this.borderRadius: 0,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: RectangularImage(
        imageUrl: imageUrl,
        height: height,
        width: width,
      ),
    );
  }
}
