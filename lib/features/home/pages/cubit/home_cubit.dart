import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:your_weather/app/core/enums.dart';
import 'package:your_weather/models/weather_model.dart';
import 'package:your_weather/repositories/weather_repository.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.weatherRepository}) : super(HomeState());

  final WeatherRepository weatherRepository;

  Future<void> getWeatherModel({
    required String city,
  }) async {
    emit(HomeState(status: Status.loading));
    try {
      final weatherModel = await weatherRepository.getWeatherModel(city: city);
      emit(
        HomeState(
          model: weatherModel,
          status: Status.success,
        ),
      );
    } catch (error) {
      emit(
        HomeState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
