library stack_navigation;

import 'dart:collection';

import 'package:flutter/material.dart';

class NavigationHomePage extends StatefulWidget {
  NavigationHomePage({
    Key key,
    @required this.pages,
    @required this.observers,
    @required this.bottomNavigationBarItems,
    this.bottomNavigationBarUnselectedItemColor: Colors.grey,
    this.bottomNavigationBarSelectedItemColor: Colors.white,
    this.bottomNavigationBarType: BottomNavigationBarType.fixed,
    this.bottomNavigationBarOnTap,
  })  : assert(pages != null),
        assert(bottomNavigationBarItems != null),
        assert(pages.length == bottomNavigationBarItems.length),
        super(key: key);
  final List<PageInfo> pages;
  final List<RouteObserver<PageRoute<dynamic>>> observers;
  final List<BottomNavigationBarItem> bottomNavigationBarItems;
  final Color bottomNavigationBarUnselectedItemColor;
  final Color bottomNavigationBarSelectedItemColor;
  final BottomNavigationBarType bottomNavigationBarType;
  final Function(int index) bottomNavigationBarOnTap;

  @override
  _NavigationHomePageState createState() => _NavigationHomePageState();
}

class _NavigationHomePageState extends State<NavigationHomePage> {
  @override
  void initState() {
    super.initState();
    NavigationStacks._init(widget.pages.length, this, widget.observers ?? []);
    int i = 0;
    widget.pages.forEach((element) {
      NavigationStacks.stacks[i].add(element);
      i++;
    });
  }

  void _onItemTapped(int index) {
    NavigationStacks._changeIndex(index);
    widget.bottomNavigationBarOnTap(index);
  }

  Future<bool> _onWillPop() {
    NavigationStacks.pop();
  }

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: NavigationStacks.stacks[_NavBarIndex.getIndex()].last.page,
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: widget.bottomNavigationBarUnselectedItemColor,
          selectedItemColor: widget.bottomNavigationBarSelectedItemColor,
          type: widget.bottomNavigationBarType,
          currentIndex: _NavBarIndex.getIndex(),
          onTap: _onItemTapped,
          items: widget.bottomNavigationBarItems,
        ),
      ),
    );
  }
}

class PageInfo {
  final Widget page;
  final String routeName;

  PageInfo(this.page, this.routeName);
}

class NavigationStacks {
  static List<Queue<PageInfo>> stacks = <Queue<PageInfo>>[];
  static List<RouteObserver<PageRoute<dynamic>>> _observers;
  static _NavigationHomePageState _homeState;

  static List<int> _stackHistory = [];

  static _init(int length, State home,
      List<RouteObserver<PageRoute<dynamic>>> observers) {
    _homeState = home;
    if (stacks.length == 0) {
      for (int i = 0; i < length; i++) {
        stacks.add(Queue<PageInfo>());
      }
    }
    _observers = observers;
    _stackHistory.add(0);
  }

  static _changeIndex(int stackNumber) {
    if (_NavBarIndex.getIndex() == stackNumber) {
      NavigationStacks._popToFirst();
    } else {
      _NavBarIndex.setIndex(stackNumber);
      _observers.forEach((element) {
        element.didPush(_getRouteFromName(stacks[stackNumber].last.routeName),
            _getRouteFromName(null));
      });
    }

    //add current index as last item in to stack history
    _stackHistory.remove(stackNumber);
    _stackHistory.add(stackNumber);

    _homeState.refresh();
  }

  static _popStackHistory() {
    print("popping Stack history $_stackHistory");
    String prevName = stacks[_NavBarIndex.getIndex()].last.routeName;
    if (_stackHistory.length >= 1) {
      _stackHistory.removeLast();
    }
    _observers.forEach((element) {
      element.didPop(
          _getRouteFromName(stacks[_NavBarIndex.getIndex()].last.routeName),
          _getRouteFromName(prevName));
    });
    _NavBarIndex.setIndex(_stackHistory.last);
    _homeState.refresh();
  }

  static bool pop() {
    int stackNumber = _NavBarIndex.getIndex();
    print(
        "popping stacknum $stackNumber with len ${stacks[stackNumber].length}");
    if (stacks[stackNumber].length <= 1) {
      _popStackHistory();
      return false;
    }
    String prevName = stacks[stackNumber].last.routeName;
    stacks[stackNumber].removeLast();
    _observers.forEach((element) {
      element.didPop(_getRouteFromName(prevName),
          _getRouteFromName(stacks[stackNumber].last.routeName));
    });
    _homeState.refresh();
    return true;
  }

  static _popToFirst() {
    int stackNumber = _NavBarIndex.getIndex();
    for (int i = 0; i < stacks[stackNumber].length - 1; i++) {
      String prevName = stacks[stackNumber].last.routeName;
      stacks[stackNumber].removeLast();
      _observers.forEach((element) {
        element.didPop(_getRouteFromName(stacks[stackNumber].last.routeName),
            _getRouteFromName(prevName));
      });
    }
  }

  static push(Widget route, String routeName) {
    int stackNumber = _NavBarIndex.getIndex();
    print('adding to ' + stackNumber.toString());

    _observers.forEach((element) {
      element.didPush(_getRouteFromName(routeName),
          _getRouteFromName(stacks[stackNumber].last.routeName));
    });
    stacks[stackNumber].addLast(PageInfo(route, routeName));
    _homeState.refresh();
  }

  static MaterialPageRoute _getRouteFromName(String name) => MaterialPageRoute(
      builder: (BuildContext context) {}, settings: RouteSettings(name: name));
}

class _NavBarIndex {
  static final _NavBarIndex _instance = _NavBarIndex._internal();

  int index = 0;

  static void setIndex(int index) {
    _instance.index = index;
  }

  static int getIndex() {
    return _instance.index;
  }

  factory _NavBarIndex() {
    return _instance;
  }

  _NavBarIndex._internal();
}
