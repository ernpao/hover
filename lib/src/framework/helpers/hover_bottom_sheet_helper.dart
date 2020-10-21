import 'package:flutter/material.dart';

class HoverBottomSheetHelper {
  static void showBottomDrawer(
    BuildContext context,
    Widget Function(BuildContext) builder,
  ) {
    Scaffold.of(context).showBottomSheet(builder);
  }
}
