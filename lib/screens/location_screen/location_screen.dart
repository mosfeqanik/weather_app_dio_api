import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_api/provider/weather_provider.dart';
import 'package:weather_app_api/screens/city_screen/city_screen.dart';
import 'package:weather_app_api/testing/page1.dart';
import 'package:weather_app_api/utilies/constants.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    super.initState();
    WeatherProvider weatherProvider =
        Provider.of<WeatherProvider>(context, listen: false);
    weatherProvider.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (_, myProvider, ___) {
        return Scaffold(
          body: myProvider.isLoading == false
              ? Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage(
                          'assets/images/location_background.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(0.8), BlendMode.dstATop),
                    ),
                  ),
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            TextButton(
                              onPressed: () {
                                myProvider.isLoading = true;
                                myProvider.getLocation();
                              },
                              child: const Icon(
                                Icons.near_me,
                                size: 50.0,
                                color: Colors.white,
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                try {
                                  String cityName =
                                      await Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                    return CityScreen();
                                  }));

                                  myProvider.isLoading = true;

                                  myProvider.loadWeatherByCityName(cityName);
                                } catch (error) {
                                  print(error);
                                }
                              },
                              child: const Icon(
                                Icons.location_city,
                                size: 50.0,
                                color: Colors.white,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Page1();
                                }));
                              },
                              child: Icon(Icons.ac_unit_outlined),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                '${myProvider.myWeather.main.temp.toInt()} °',
                                style: kTempTextStyle,
                              ),
                              Text(
                                myProvider.weatherModel.getWeatherIcon(
                                    myProvider.myWeather.weather[0].id),
                                style: kConditionTextStyle,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15.0),
                          child: Text(
                            '${myProvider.weatherModel.getMessage(myProvider.myWeather.main.temp.toInt())} ${myProvider.myWeather.name}',
                            textAlign: TextAlign.start,
                            style: kMessageTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
