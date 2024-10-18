part of 'weatherbloc_bloc.dart';

abstract class WeatherBlocEvent extends Equatable {
  const WeatherBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchWeatherEvt extends WeatherBlocEvent {
  final Position position;

  const FetchWeatherEvt({required this.position});
}
