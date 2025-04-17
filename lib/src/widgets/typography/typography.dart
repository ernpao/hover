import 'package:flutter/material.dart';

class HoverText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final double? bottomPadding;
  final double? topPadding;
  final double? leftPadding;
  final double? rightPadding;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final bool? softWrap;
  final double? lineHeight;
  HoverText(
    this.text, {
    this.textAlign,
    this.fontSize,
    this.leftPadding,
    this.topPadding,
    this.rightPadding,
    this.bottomPadding,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.softWrap,
    this.lineHeight,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        leftPadding ?? 8.0,
        topPadding ?? 0.0,
        rightPadding ?? 8.0,
        bottomPadding ?? 0.0,
      ),
      child: Text(
        text,
        textAlign: textAlign,
        softWrap: softWrap ?? true,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          fontStyle: fontStyle,
          color: color,
          height: lineHeight,
        ),
      ),
    );
  }
}

class HoverTitle extends HoverText {
  HoverTitle(
    String text, {
    final TextAlign? textAlign,
    final double? fontSize,
    final double? bottomPadding,
    final double? topPadding,
    final Color? color,
    final FontWeight? fontWeight,
    final FontStyle? fontStyle = FontStyle.normal,
  }) : super(
          text,
          textAlign: textAlign ?? TextAlign.center,
          topPadding: topPadding ?? 8.0,
          bottomPadding: bottomPadding ?? 8.0,
          color: color,
          fontWeight: fontWeight ?? FontWeight.bold,
          fontSize: fontSize ?? 24,
          fontStyle: fontStyle,
        );
}

class HoverHeading extends HoverText {
  HoverHeading(
    String text, {
    final TextAlign? textAlign,
    final double? fontSize,
    final double? bottomPadding,
    final double? topPadding,
    final Color? color,
    final FontWeight? fontWeight = FontWeight.bold,
    final FontStyle? fontStyle = FontStyle.normal,
  }) : super(
          text,
          textAlign: textAlign ?? TextAlign.center,
          topPadding: topPadding ?? 8.0,
          bottomPadding: bottomPadding ?? 8.0,
          color: color,
          fontWeight: fontWeight ?? FontWeight.bold,
          fontSize: fontSize ?? 16.0,
          fontStyle: fontStyle,
        );
}

class HoverLinkText extends StatelessWidget {
  final String text;
  final Function()? onTap;
  HoverLinkText(
    this.text, {
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: onTap,
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
