import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  final Location location;
  final Current current;

  WeatherModel({
    required this.location,
    required this.current,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}

@JsonSerializable()
class Current {
  @JsonKey(name: 'temp_c')
  final double tempC;
  @JsonKey(name: 'temp_f')
  final double tempF;
  @JsonKey(name: 'is_day')
  final int isDay;
  final Condition condition;
  @JsonKey(name: 'wind_kph')
  final double windKph;
  @JsonKey(name: 'pressure_in')
  final double pressureIn;
  @JsonKey(name: 'precip_mm')
  final double precipMm;
  final int humidity;
  final int cloud;
  @JsonKey(name: 'vis_km')
  final double visKm;

  Current({
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windKph,
    required this.pressureIn,
    required this.precipMm,
    required this.humidity,
    required this.cloud,
    required this.visKm,
  });

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}

@JsonSerializable()
class Condition {
  final String text;
  final String icon;

  Condition({
    required this.text,
    required this.icon,
  });

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}

@JsonSerializable()
class Location {
  final String name;

  Location({
    required this.name,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
