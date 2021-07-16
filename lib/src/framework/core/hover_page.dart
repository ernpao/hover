import 'package:flutter/material.dart';

import 'hover_page_base.dart';

abstract class HoverPage extends HoverPageBase {
  HoverPage({
    String? title,
    Color? backgroundColor,
    bool disableAppBar = false,
    bool disableDrawer = false,
    bool disableFAB = false,
  }) : super(
          title: title,
          backgroundColor: backgroundColor,
          disableAppBar: disableAppBar,
          disableDrawer: disableDrawer,
          disableFAB: disableFAB,
        );
}
