import 'hourly_forecast.dart';

class Weather{
  final double currentTemp, currentPressure, currentWindSpeed, currentHumidity;
  final String currentSky;
  final List<HourlyForecast> hourlyForecasts;

  const Weather({
    required this.currentTemp,
    required this.currentPressure,
    required this.currentWindSpeed,
    required this.currentHumidity,
    required this.currentSky,
    required this.hourlyForecasts,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Weather &&
          runtimeType == other.runtimeType &&
          currentTemp == other.currentTemp &&
          currentPressure == other.currentPressure &&
          currentWindSpeed == other.currentWindSpeed &&
          currentHumidity == other.currentHumidity &&
          currentSky == other.currentSky &&
          hourlyForecasts == other.hourlyForecasts);

  @override
  int get hashCode =>
      currentTemp.hashCode ^
      currentPressure.hashCode ^
      currentWindSpeed.hashCode ^
      currentHumidity.hashCode ^
      currentSky.hashCode ^
      hourlyForecasts.hashCode;

  @override
  String toString() {
    return 'Weather{ currentTemp: $currentTemp, currentPressure: $currentPressure, currentWindSpeed: $currentWindSpeed, currentHumidity: $currentHumidity, currentSky: $currentSky, hourlyForecasts: $hourlyForecasts,}';
  }

  Weather copyWith({
    double? currentTemp,
    double? currentPressure,
    double? currentWindSpeed,
    double? currentHumidity,
    String? currentSky,
    List<HourlyForecast>? hourlyForecasts,
  }) {
    return Weather(
      currentTemp: currentTemp ?? this.currentTemp,
      currentPressure: currentPressure ?? this.currentPressure,
      currentWindSpeed: currentWindSpeed ?? this.currentWindSpeed,
      currentHumidity: currentHumidity ?? this.currentHumidity,
      currentSky: currentSky ?? this.currentSky,
      hourlyForecasts: hourlyForecasts ?? this.hourlyForecasts,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'currentTemp': currentTemp,
      'currentPressure': currentPressure,
      'currentWindSpeed': currentWindSpeed,
      'currentHumidity': currentHumidity,
      'currentSky': currentSky,
      'hourlyForecasts': hourlyForecasts,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    final currentWeatherData = map['list'][0];
    final List<HourlyForecast> hourlyForecasts = (map['list'] as List)
        .skip(1)  // Skip the first item as it is for the current weather
        .map((hourlyData) => HourlyForecast.fromMap(hourlyData))
        .toList();
    return Weather(
      currentTemp: (currentWeatherData['main']['temp']).round(),
      currentPressure: currentWeatherData['main']['pressure'],
      currentWindSpeed: currentWeatherData['wind']['speed'],
      currentHumidity: currentWeatherData['main']['humidity'],
      currentSky: currentWeatherData['weather'][0]['main'],
      hourlyForecasts: hourlyForecasts,
    );
  }
}