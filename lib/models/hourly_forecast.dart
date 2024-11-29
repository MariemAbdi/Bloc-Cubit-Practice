import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HourlyForecast {
  final String time;
  final double temperature;
  final IconData icon;

  HourlyForecast({
    required this.time,
    required this.temperature,
    required this.icon,
  });

  factory HourlyForecast.fromMap(Map<String, dynamic> map) {
    final weather = map['weather'][0]['main'];
    final time = DateTime.parse(map['dt_txt']);
    return HourlyForecast(
      time: DateFormat.j().format(time), // Format time as per your requirement
      temperature: (map['main']['temp']).round(),
      icon: weather == 'Clouds' || weather == 'Rain' ? Icons.cloud : Icons
          .sunny,
    );
  }
}