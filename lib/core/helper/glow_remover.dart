import 'package:flutter/material.dart';

Widget glowRemover(BuildContext context, Widget? child) {
  return ScrollConfiguration(
    behavior: MyBehavior(),
    child: child!,
  );
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
