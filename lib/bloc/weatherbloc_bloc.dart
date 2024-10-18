import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

part 'weatherbloc_event.dart';
part 'weatherbloc_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<FetchWeatherEvt>(_fetchWeatherEventHandler);
  }

  _fetchWeatherEventHandler(FetchWeatherEvt event, emit) async {
    emit(WeatherBlockLoading());
    try {
      WeatherFactory wf = new WeatherFactory("8d57a4aeeffa5f9e63a332d18710c52b", language: Language.FRENCH);
      Weather weather = await wf.currentWeatherByLocation(event.position.latitude, event.position.longitude);
      emit(WeatherBlocSuccess(weather));
    } catch (_) {
      emit(WeatherBlockFailure());
    }
  }
}
