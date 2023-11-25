import 'package:your_weather/data/remote_data_sources/weather_remote_data_source.dart';
import 'package:your_weather/models/weather_model.dart';

class WeatherRepository {
  WeatherRepository(this._weatherRemoteDataSource);

  final WeatherRemoteRetrofitDataSource _weatherRemoteDataSource;

  Future<WeatherModel?> getWeatherModel({
    required String city,
  }) async {
    return _weatherRemoteDataSource.getWeatherData(city);
  }
}
