import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformWidgets extends StatelessWidget {
  final WidgetBuilder androidBuilder;
  final WidgetBuilder iosBuilder;

  const PlatformWidgets({
    super.key,
    required this.androidBuilder,
    required this.iosBuilder,
  });

  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return androidBuilder(context);
      case TargetPlatform.iOS:
        return iosBuilder(context);
      default:
        return androidBuilder(context);
    }
  }
}
