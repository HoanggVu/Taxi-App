
import 'package:doantaxi/src/check/check_info.dart';
import 'package:flutter/material.dart';

class MyApp extends InheritedWidget {
  final CheckInfo checkInfo;
  final Widget child;
  MyApp(this.checkInfo, this.child) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static MyApp? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyApp>();
  }
}
