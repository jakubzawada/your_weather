import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:your_weather/data/remote_data_sources/weather_remote_data_source.dart';
import 'package:your_weather/features/home/pages/cubit/home_cubit.dart';
import 'package:your_weather/repositories/weather_repository.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  // Bloc
  getIt.registerFactory(() => HomeCubit(weatherRepository: getIt()));

  // Repositories
  getIt.registerFactory(
      () => WeatherRepository(weatherRemoteDataSource: getIt()));

  // DataSources
  getIt.registerFactory(() => WeatherRemoteRetrofitDataSource(Dio()));
}
