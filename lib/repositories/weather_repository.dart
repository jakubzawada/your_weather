import 'package:injectable/injectable.dart';
import 'package:your_weather/data/remote_data_sources/weather_remote_data_source.dart';
import 'package:your_weather/models/weather_model.dart';

@injectable
class WeatherRepository {
  WeatherRepository({required this.weatherRemoteDataSource});

  final WeatherRemoteRetrofitDataSource weatherRemoteDataSource;

  Future<WeatherModel?> getWeatherModel({
    required String city,
  }) async {
    return weatherRemoteDataSource.getWeatherData(city);
  }
}
