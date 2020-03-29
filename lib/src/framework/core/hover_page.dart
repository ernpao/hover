import 'package:flutter/material.dart';
import 'hover_core.dart';

abstract class HoverPage extends HoverPageBase {
  HoverPage({
    String title,
    Color backgroundColor,
  }) : super(title: title, backgroundColor: backgroundColor);
}
