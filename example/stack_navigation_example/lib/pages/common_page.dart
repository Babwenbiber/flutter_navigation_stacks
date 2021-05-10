import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../nav/navigation_utils.dart';

class CommonPage extends StatelessWidget {
  const CommonPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("common building");
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("COMMON"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton.extended(
              label: Text('Goto page 1 tab 1'),
              onPressed: () {
                StackNavigator.navigateToPage1_1();
              },
            ),
            FloatingActionButton.extended(
              label: Text('Goto page 2 tab 1'),
              onPressed: () {
                StackNavigator.navigateToPage2_1();
              },
            ),
            FloatingActionButton.extended(
              label: Text('Goto page 1 tab 2'),
              onPressed: () {
                StackNavigator.navigateToPage2_1();
              },
            ),
            FloatingActionButton.extended(
              label: Text('Goto page 2 tab 2'),
              onPressed: () {
                StackNavigator.navigateToPage2_2();
              },
            ),
          ],
        ),
      ),
    );
  }
}
