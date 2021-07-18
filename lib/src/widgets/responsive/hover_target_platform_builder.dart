import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// A builder that is given the [TargetPlatform] derived
/// from Theme.of(context).platform and a bool
/// that indicates if the target is web.
class HoverTargetPlatformBuilder extends StatelessWidget {
  const HoverTargetPlatformBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  final Widget Function(
      BuildContext context, TargetPlatform platform, bool isWeb) builder;

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    final isWeb = kIsWeb;
    return builder(context, platform, isWeb);
  }
}
