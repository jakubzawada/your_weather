import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:your_weather/data/remote_data_sources/weather_remote_data_source.dart';
import 'package:your_weather/models/weather_model.dart';
import 'package:your_weather/repositories/weather_repository.dart';

class MockWeatherDataSource extends Mock
    implements WeatherRemoteRetrofitDataSource {}

void main() {
  late WeatherRepository sut;
  late MockWeatherDataSource dataSource;

  setUp(() {
    dataSource = MockWeatherDataSource();
    sut = WeatherRepository(weatherRemoteDataSource: dataSource);
  });

  group('getWeatherModel', () {
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
    test('should call remoteDataSource.getWeatherModel() method', () async {
      // 1
      when(() => dataSource.getWeatherData('city'))
          .thenAnswer((_) async => expectedWeatherModel);
      // 2
      await sut.getWeatherModel(city: 'city');
      // 3
      verify(() => dataSource.getWeatherData('city')).called(1);
    });

    test('should return WeatherModel', () async {
      // 1
      when(() => dataSource.getWeatherData('city'))
          .thenAnswer((_) async => expectedWeatherModel);
      // 2
      final results = await sut.getWeatherModel(city: 'city');
      // 3
      expect(
        results,
        expectedWeatherModel,
      );
    });
  });
}
