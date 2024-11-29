part of 'weather_bloc.dart';
///EVENTS SHOULD BE IN PAST TENSE
sealed class WeatherEvent {}

class WeatherFetched extends WeatherEvent {}