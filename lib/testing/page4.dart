import 'package:flutter/material.dart';
import 'package:weather_app_api/testing/page5.dart';


class Page4 extends StatelessWidget {

  final String valueFor5;
  Page4(this.valueFor5);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 4"),
      ),
      body: Page5(valueFor5),
    );
  }
}