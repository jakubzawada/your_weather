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

// @JsonSerializable()
// class WeatherModel {
//   final Location location;
//   final Current current;

//   WeatherModel({
//     required this.location,
//     required this.current,
//   });

//   factory WeatherModel.fromJson(Map<String, dynamic> json) =>
//       _$WeatherModelFromJson(json);

//   Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
// }

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

// @JsonSerializable()
// class Current {
//   final Condition condition;
//   final int humidity;
//   final int cloud;
//   @JsonKey(name: 'temp_c')
//   final double tempC;
//   @JsonKey(name: 'temp_f')
//   final double tempF;
//   @JsonKey(name: 'is_day')
//   final int isDay;
//   @JsonKey(name: 'wind_kph')
//   final double windKph;
//   @JsonKey(name: 'pressure_in')
//   final double pressureIn;
//   @JsonKey(name: 'precip_mm')
//   final double precipMm;
//   @JsonKey(name: 'vis_km')
//   final double visKm;

//   Current({
//     required this.tempC,
//     required this.tempF,
//     required this.isDay,
//     required this.condition,
//     required this.windKph,
//     required this.pressureIn,
//     required this.precipMm,
//     required this.humidity,
//     required this.cloud,
//     required this.visKm,
//   });

//   factory Current.fromJson(Map<String, dynamic> json) =>
//       _$CurrentFromJson(json);

//   Map<String, dynamic> toJson() => _$CurrentToJson(this);
// }

@freezed
class Condition with _$Condition {
  factory Condition(
    String text,
    String icon,
  ) = _Condition;

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);
}

// @JsonSerializable()
// class Condition {
//   final String text;
//   final String icon;

//   Condition({
//     required this.text,
//     required this.icon,
//   });

//   factory Condition.fromJson(Map<String, dynamic> json) =>
//       _$ConditionFromJson(json);

//   Map<String, dynamic> toJson() => _$ConditionToJson(this);
// }

@freezed
class Location with _$Location {
  factory Location(
    String name,
  ) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

// @JsonSerializable()
// class Location {
//   final String name;

//   Location({
//     required this.name,
//   });

//   factory Location.fromJson(Map<String, dynamic> json) =>
//       _$LocationFromJson(json);

//   Map<String, dynamic> toJson() => _$LocationToJson(this);
// }
