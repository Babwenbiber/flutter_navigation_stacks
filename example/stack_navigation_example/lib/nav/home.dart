import 'package:flutter/material.dart';
import 'package:stack_navigation/stack_navigation.dart';

import '../observer/observer.dart';
import '../pages/page1_1.dart';
import '../pages/page1_2.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final RouteObserver observer = CustomObserver();

  @override
  Widget build(BuildContext context) {
    return NavigationHomePage(pages: [
      PageInfo(Page1_1(), "page1_1"),
      PageInfo(Page1_2(), "page1_2"),
    ], observers: [
      observer
    ], bottomNavigationBarItems: [
      BottomNavigationBarItem(icon: Icon(Icons.ac_unit), title: Text("tab 1")),
      BottomNavigationBarItem(icon: Icon(Icons.details), title: Text("tab 2")),
    ]);
  }
}
