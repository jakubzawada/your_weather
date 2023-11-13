part of 'home_cubit.dart';

class HomeState {
  const HomeState({
    this.model,
    this.status = Status.initial,
    this.errorMessage,
  });
  final WeatherModel? model;
  final Status status;
  final String? errorMessage;
}
