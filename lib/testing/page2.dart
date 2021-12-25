import 'package:flutter/material.dart';
import 'package:weather_app_api/testing/page3.dart';


class Page2 extends StatelessWidget {
  final String valueFor5;
  Page2(this.valueFor5);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
      ),
      body: Page3(valueFor5),
    );
  }
}
