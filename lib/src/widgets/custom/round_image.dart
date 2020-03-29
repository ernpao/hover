import 'package:flutter/material.dart';

class RoundImage extends StatelessWidget {
  final String imageUrl;
  final double size;
  RoundImage({
    @required this.imageUrl,
    @required this.size,
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
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
