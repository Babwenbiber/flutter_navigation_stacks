import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../nav/navigation_utils.dart';

class Page1_2 extends StatelessWidget {
  const Page1_2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("1_2 building");
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("page 1 tab 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("this is page 1 tab 2"),
            SizedBox(
              height: 20,
            ),
            FloatingActionButton.extended(
              label: Text('next page'),
              onPressed: () {
                StackNavigator.navigateToPage2_2();
              },
            )
          ],
        ),
      ),
    );
  }
}
