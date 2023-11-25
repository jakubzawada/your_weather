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
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Current(
    Condition condition,
    int humidity,
    int cloud,
    double tempC,
    double tempF,
    int isDay,
    double windKph,
    double pressureIn,
    double precipMm,
    double visKm,
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
