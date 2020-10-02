import 'package:flutter/material.dart';

class HoverRoundImage extends StatelessWidget {
  final String imageUrl;
  final double radius;
  final BoxFit fit;
  HoverRoundImage({
    @required this.imageUrl,
    @required this.radius,
    this.fit: BoxFit.cover,
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
          fit: fit,
        ),
      ),
    );
  }
}
