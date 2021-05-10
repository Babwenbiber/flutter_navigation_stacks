import 'package:flutter/material.dart';
import 'package:stack_navigation/stack_navigation.dart';

import '../pages/common_page.dart';
import '../pages/page1_1.dart';
import '../pages/page1_2.dart';
import '../pages/page2_1.dart';
import '../pages/page2_2.dart';

class StackNavigator {
  static final StackNavigator _instance = StackNavigator._internal();
  List<RouteObserver<PageRoute<dynamic>>> _observers = [];

  factory StackNavigator() {
    return _instance;
  }
  StackNavigator._internal();

  static addObserver(RouteObserver<PageRoute<dynamic>> observer) {
    _instance._observers.add(observer);
  }

  static bool navigatePop() {
    return NavigationStacks.pop();
  }

  static navigateToPage1_1() {
    NavigationStacks.push(Page1_1(), "page1_1");
  }

  static navigateToPage1_2() {
    NavigationStacks.push(Page1_2(), "page1_2");
  }

  static navigateToPage2_1() {
    NavigationStacks.push(Page2_1(), "page2_1");
  }

  static navigateToPage2_2() {
    NavigationStacks.push(Page2_2(), "page2_2");
  }

  static navigateToCommonPage() {
    NavigationStacks.push(CommonPage(), "common");
  }
}
