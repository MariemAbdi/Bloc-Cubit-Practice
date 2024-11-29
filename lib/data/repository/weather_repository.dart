import 'dart:convert';

import 'package:state_management_cubit/data/data_provider/weather_data_provider.dart';

import '../../models/weather.dart';

///TAKING THE RAW DATA PROVIDED FROM PROVIDER AND CONVERTING IT INTO DATA MODEL
class WeatherRepository{
  final WeatherProvider weatherProvider;

  WeatherRepository(this.weatherProvider);

  Future<Weather> getCurrentWeather() async {
    try {
      String cityName = 'Tunisia';
      final weatherData = await weatherProvider.getCurrentWeather(cityName);

      final data = jsonDecode(weatherData);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      return Weather.fromMap(data);
    } catch (e) {
      throw e.toString();
    }
  }
}