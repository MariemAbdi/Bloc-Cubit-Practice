part of 'weather_bloc.dart';
class WeatherState {}

final class WeatherInitial extends WeatherState{}
final class WeatherSuccess extends WeatherState{
  final Weather weather;
  WeatherSuccess({required this.weather});
}
final class WeatherFailure extends WeatherState{
  final String errorMessage;
  WeatherFailure(this.errorMessage);
}
final class WeatherLoading extends WeatherState{}
