// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:your_weather/app/core/injection_container.dart' as _i7;
import 'package:your_weather/data/remote_data_sources/weather_remote_data_source.dart'
    as _i4;
import 'package:your_weather/features/home/pages/cubit/home_cubit.dart' as _i6;
import 'package:your_weather/repositories/weather_repository.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.lazySingleton<_i3.Dio>(
        () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.factory<_i4.WeatherRemoteRetrofitDataSource>(
        () => _i4.WeatherRemoteRetrofitDataSource(gh<_i3.Dio>()));
    gh.factory<_i5.WeatherRepository>(() => _i5.WeatherRepository(
        weatherRemoteDataSource: gh<_i4.WeatherRemoteRetrofitDataSource>()));
    gh.factory<_i6.HomeCubit>(
        () => _i6.HomeCubit(weatherRepository: gh<_i5.WeatherRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i7.RegisterModule {}
