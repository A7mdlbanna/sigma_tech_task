import 'package:flutter/material.dart';


void pop({BuildContext? context}) {
  if(ModalRoute.of(context??navigatorKey.currentContext!)?.isCurrent != true) Navigator.pop(context??navigatorKey.currentContext!);
}

pushPage(Widget widget, {BuildContext? context}) {
  return Navigator.of(context??navigatorKey.currentContext!).push(
    MaterialPageRoute<dynamic>(builder: (BuildContext context) => widget),
  );
}


void pushReplacement(Widget widget, {BuildContext? context, dynamic arguments}) {
  Navigator.of(context ?? navigatorKey.currentContext!).pushReplacement(
    MaterialPageRoute<dynamic>(builder: (BuildContext context) => widget),
  );
}

void popAllAndPushPage(Widget widget, {BuildContext? context}) {
  Navigator.of(context??navigatorKey.currentContext!).pushAndRemoveUntil(
    MaterialPageRoute<dynamic>(builder: (BuildContext context) => widget),
    (Route<dynamic> route) => false,
  );
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
