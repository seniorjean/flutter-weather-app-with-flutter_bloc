part of 'weatherbloc_bloc.dart';

abstract class WeatherBlocState extends Equatable {
  const WeatherBlocState();
}

class WeatherBlocInitial extends WeatherBlocState {
  @override
  List<Object?> get props => [];
}

class WeatherBlockLoading extends WeatherBlocState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class WeatherBlockFailure extends WeatherBlocState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class WeatherBlocSuccess extends WeatherBlocState {
  final Weather weather;

  const WeatherBlocSuccess(this.weather);

  @override
  List<Object?> get props => [weather];
}
