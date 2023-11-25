import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:your_weather/models/weather_model.dart';

part 'weather_remote_data_source.g.dart';

@RestApi(baseUrl: 'http://api.weatherapi.com/v1/')
abstract class WeatherRemoteRetrofitDataSource {
  factory WeatherRemoteRetrofitDataSource(
    Dio dio, {
    String baseUrl,
  }) = _WeatherRemoteRetrofitDataSource;

  @GET("/current.json?key=b821803746da4ed9a0d162057231311&aqi=no")
  Future<WeatherModel> getWeatherData(@Query("q") String city);
}
