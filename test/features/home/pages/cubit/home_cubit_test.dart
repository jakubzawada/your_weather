import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:your_weather/app/core/enums.dart';
import 'package:your_weather/features/home/pages/cubit/home_cubit.dart';
import 'package:your_weather/models/weather_model.dart';
import 'package:your_weather/repositories/weather_repository.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  late HomeCubit sut;
  late MockWeatherRepository repository;

  setUp(() {
    repository = MockWeatherRepository();
    sut = HomeCubit(weatherRepository: repository);
  });

  group('getWeatherModel', () {
    group('success', () {
      final expectedWeatherModel = WeatherModel(
        Location('City'),
        Current(
          Condition('Clear', '01d'),
          50,
          20,
          25.0,
          77.0,
          1,
          10.0,
          29.92,
          0.0,
          10.0,
        ),
      );
      setUp(() {
        when(() => repository.getWeatherModel(city: 'city'))
            .thenAnswer((_) async => expectedWeatherModel);
      });
      blocTest<HomeCubit, HomeState>(
        'emits Status.loading then Status.succes with weatherModel',
        build: () => sut,
        act: (cubit) => cubit.getWeatherModel(city: 'city'),
        expect: () => [
          HomeState(
            status: Status.loading,
          ),
          HomeState(
            status: Status.success,
            model: expectedWeatherModel,
          ),
        ],
      );
    });
    group('failure', () {
      setUp(() {
        when(() => repository.getWeatherModel(city: 'city'))
            .thenThrow(Exception('test-exception-error'));
      });
      blocTest<HomeCubit, HomeState>(
        'emits Status.loading then Status.error with error message',
        build: () => sut,
        act: (cubit) => cubit.getWeatherModel(city: 'city'),
        expect: () => [
          HomeState(
            status: Status.loading,
          ),
          HomeState(
            status: Status.error,
            errorMessage: 'Exception: test-exception-error',
          ),
        ],
      );
    });
  });
}
