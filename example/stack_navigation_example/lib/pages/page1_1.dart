import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stack_navigation_example/nav/navigation_utils.dart';

class Page1_1 extends StatelessWidget {
  const Page1_1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("1_1 building");
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("page 1 tab 1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("this is page 1 tab 1"),
            SizedBox(
              height: 20,
            ),
            FloatingActionButton.extended(
              label: Text('next page'),
              onPressed: () {
                StackNavigator.navigateToPage2_1();
              },
            )
          ],
        ),
      ),
    );
  }
}
