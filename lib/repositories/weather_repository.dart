import 'package:your_weather/data/remote_data_sources/weather_remote_data_source.dart';
import 'package:your_weather/models/weather_model.dart';

class WeatherRepository {
  WeatherRepository(this._weatherRemoteDataSource);

  final WeatherRemoteDataSource _weatherRemoteDataSource;

  Future<WeatherModel?> getWeatherModel({
    required String city,
  }) async {
    final responseData = await _weatherRemoteDataSource.getWeatherData(
      city: city,
    );

    if (responseData == null) {
      return null;
    }

    final name = responseData['location']['name'] as String;
    final temperature = (responseData['current']['temp_c'] + 0.0) as double;
    final icon = responseData['current']['condition']['icon'] as String;
    final isDay = responseData['current']['is_day'] as int;
    final text = responseData['current']['condition']['text'] as String;
    final windKph = (responseData['current']['wind_kph'] + 0.0) as double;
    final pressure = (responseData['current']['pressure_in'] + 0.0) as double;
    final precipMm = (responseData['current']['precip_mm'] + 0.0) as double;
    final humidity = responseData['current']['humidity'] as int;
    final cloud = responseData['current']['cloud'] as int;
    final tempF = (responseData['current']['temp_f'] + 0.0) as double;
    final visKm = (responseData['current']['vis_km'] + 0.0) as double;

    return WeatherModel(
      city: name,
      temperature: temperature,
      icon: icon,
      isDay: isDay,
      text: text,
      windkKph: windKph,
      pressure: pressure,
      precipMm: precipMm,
      humidity: humidity,
      cloud: cloud,
      tempF: tempF,
      visKm: visKm,
    );
  }
}
