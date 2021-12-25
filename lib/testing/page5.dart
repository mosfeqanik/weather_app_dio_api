import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_app_api/provider/weather_provider.dart';

class Page5 extends StatelessWidget {
  final String valueFor5;

  Page5(this.valueFor5);

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (_, provider, __) {
        return Scaffold(
          appBar: AppBar(
            title: Text(provider.myWeather.name),
          ),
          body: Center(
            child: Text(valueFor5),
          ),
        );
      },
    );
  }
}
