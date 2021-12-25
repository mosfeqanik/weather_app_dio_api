import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app_api/models/mylocation.dart';
import 'package:weather_app_api/models/myweather.dart';
import 'package:weather_app_api/repository/repository.dart';
import 'package:weather_app_api/weather_controller/weather_controller.dart';


class WeatherProvider with ChangeNotifier {
  bool _isLoading = true;
  MyWeather? _myWeather;
  WeatherModel _weatherModel = WeatherModel();

  void getLocation() async {
    MyLocation location = MyLocation();
    await location.getLocation();
    double? lat = location.latitude;
    double? lon = location.longitude;
    loadWeather(lat!, lon!);
  }
  Future<void> loadWeather(double lat, double lon) async {
    try {
      Response response = await WeatherRepository().loadWeather(lat, lon);
      if (response.statusCode == 200) {
        ///je response ta aslo ta myweather modal er private e rakhlam
        _myWeather = MyWeather.fromJson(response.data);
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print(e);
    }
  }
  Future<void> loadWeatherByCityName(String cityName) async {
    try {
      Response response =
      await WeatherRepository().loadWeatherByCityName(cityName);
      if (response.statusCode == 200) {
        ///je response ta aslo ta myweather modal er private e rakhlam
        _myWeather = MyWeather.fromJson(response.data);
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();

      }
    } catch (e) {
      print(e);
      isLoading = false;
      notifyListeners();
    }
  }

  MyWeather get myWeather => _myWeather!;

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  WeatherModel get weatherModel => _weatherModel!;
  set weatherModel(WeatherModel value) {
    _weatherModel = value;
    notifyListeners();
  }


}
