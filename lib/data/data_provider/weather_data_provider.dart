import 'package:http/http.dart' as http;

import '../../config/constants.dart';
///Provider Class Contains All The CRUD Operations Related To Weather
///GETTING THE RAW DATA THAT WILL BE CONVERTED INTO A MODEL IN REPOSITORY
class WeatherProvider{
  Future<String> getCurrentWeather(String cityName) async {
    try {
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&units=metric&APPID=${Constants.openWeatherAPIKey}',
        ),
      );

      return res.body;
    } catch (e) {
      throw e.toString();
    }
  }
}