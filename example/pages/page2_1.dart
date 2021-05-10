import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../nav/navigation_utils.dart';

class Page2_1 extends StatelessWidget {
  const Page2_1({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("2_1 building");
    return Scaffold(
      appBar: AppBar(
        title: Text("page 2 tab 1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("this is page 2 tab 1"),
            SizedBox(
              height: 20,
            ),
            FloatingActionButton.extended(
              label: Text('previous page'),
              onPressed: () {
                StackNavigator.navigatePop();
              },
            )
          ],
        ),
      ),
    );
  }
}
