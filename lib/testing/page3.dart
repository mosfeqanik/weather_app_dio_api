import 'package:flutter/material.dart';
import 'package:weather_app_api/testing/page4.dart';


class Page3 extends StatelessWidget {
  final String valueFor5;
  Page3(this.valueFor5);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 3"),
      ),
      body: Page4(valueFor5),
    );
  }
}