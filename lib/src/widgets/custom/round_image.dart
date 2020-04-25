import 'package:flutter/material.dart';

class RoundImage extends StatelessWidget {
  final String imageUrl;
  final double size;
  final BoxFit fit;
  RoundImage({
    @required this.imageUrl,
    @required this.size,
    this.fit: BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size / 2),
        child: Image.network(
          imageUrl,
          height: size,
          width: size,
          fit: fit,
        ),
      ),
    );
  }
}
