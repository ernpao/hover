import 'package:flutter/material.dart';

class HoverText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final double bottomPadding;
  final double topPadding;
  final double leftPadding;
  final double rightPadding;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  HoverText(
    this.text, {
    this.textAlign,
    this.fontSize,
    this.leftPadding: 8.0,
    this.topPadding: 0.0,
    this.rightPadding: 8.0,
    this.bottomPadding: 0.0,
    this.color,
    this.fontWeight: FontWeight.normal,
    this.fontStyle,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        leftPadding,
        topPadding,
        rightPadding,
        bottomPadding,
      ),
      child: Text(
        text,
        textAlign: textAlign,
        softWrap: true,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          fontStyle: fontStyle,
          color: color,
        ),
      ),
    );
  }
}

class HoverTitle extends HoverText {
  HoverTitle(
    String text, {
    final TextAlign textAlign: TextAlign.center,
    final double fontSize: 24,
    final double bottomPadding: 8.0,
    final double topPadding: 8.0,
    final Color color,
    final FontWeight fontWeight: FontWeight.bold,
    final FontStyle fontStyle: FontStyle.normal,
  }) : super(
          text,
          textAlign: textAlign,
          topPadding: topPadding,
          bottomPadding: bottomPadding,
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
          fontStyle: fontStyle,
        );
}

class HoverHeading extends HoverText {
  HoverHeading(
    String text, {
    final TextAlign textAlign,
    final double fontSize: 16,
    final double bottomPadding: 8.0,
    final double topPadding: 8.0,
    final Color color,
    final FontWeight fontWeight: FontWeight.bold,
    final FontStyle fontStyle: FontStyle.normal,
  }) : super(
          text,
          textAlign: textAlign,
          topPadding: topPadding,
          bottomPadding: bottomPadding,
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
          fontStyle: fontStyle,
        );
}

class HoverLinkText extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  HoverLinkText(
    this.text, {
    @required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () {
          if (onTap != null) {
            onTap();
          }
        },
        child: Text(
          text,
          style: TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
