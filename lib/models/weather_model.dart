import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

@freezed
class WeatherModel with _$WeatherModel {
  factory WeatherModel(
    Location location,
    Current current,
  ) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}

@freezed
class Current with _$Current {
  factory Current(
    Condition condition,
    int humidity,
    int cloud,
    @JsonKey(name: 'temp_c') double tempC,
    @JsonKey(name: 'temp_f') double tempF,
    @JsonKey(name: 'is_day') int isDay,
    @JsonKey(name: 'wind_kph') double windKph,
    @JsonKey(name: 'pressure_in') double pressureIn,
    @JsonKey(name: 'precip_mm') double precipMm,
    @JsonKey(name: 'vis_km') double visKm,
  ) = _Current;

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);
}

@freezed
class Condition with _$Condition {
  factory Condition(
    String text,
    String icon,
  ) = _Condition;

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);
}

@freezed
class Location with _$Location {
  factory Location(
    String name,
  ) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
