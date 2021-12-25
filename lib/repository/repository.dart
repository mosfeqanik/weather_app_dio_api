import 'package:dio/dio.dart';
import 'package:weather_app_api/API/api_constant.dart';

const Duration timeoutDuration = const Duration(seconds: 60);

class WeatherRepository {
  //get_weather
  Future<Response> loadWeather(double latitude, double longitude) async {
    String api =
        "${ApiConstant.BASE_URL}?APPID=${ApiConstant.APP_ID}&lat=$latitude&lon=$longitude&units=${ApiConstant.TEMP_UNIT}";

    Response response = await Dio()
        .get(
          api,
        )
        .timeout(timeoutDuration);

    return response;
  }

  Future<Response> loadWeatherByCityName(String cityName) async {
    String api =
        "${ApiConstant.BASE_URL}?APPID=${ApiConstant.APP_ID}&q=$cityName&units=${ApiConstant.TEMP_UNIT}";

    Response response = await Dio()
        .get(
          api,
        )
        .timeout(timeoutDuration);

    return response;
  }
}
