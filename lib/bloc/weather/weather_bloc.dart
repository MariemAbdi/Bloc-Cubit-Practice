import 'package:bloc/bloc.dart';
import 'package:state_management_cubit/data/repository/weather_repository.dart';
import 'package:state_management_cubit/models/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<WeatherFetched>(_fetchWeather);
  }

  void _fetchWeather(WeatherFetched event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try{
      Weather currentWeather = await weatherRepository.getCurrentWeather();
      emit(WeatherSuccess(weather: currentWeather));
    }catch(error){
      emit(WeatherFailure(error.toString()));
    }
  }
}
