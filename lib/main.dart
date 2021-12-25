import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_api/provider/weather_provider.dart';
import 'package:weather_app_api/screens/location_screen/location_screen.dart';


void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider<WeatherProvider>(
          create: (context) => WeatherProvider()),
    ],
    child: MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LocationScreen(),
    );
  }
}
