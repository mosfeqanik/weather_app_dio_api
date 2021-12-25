import 'package:flutter/material.dart';
import 'package:weather_app_api/testing/page2.dart';

class Page1 extends StatelessWidget {

  String valueFor5 = "ABC";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 1"),
      ),
      body: Page2(valueFor5),
    );
  }
}
