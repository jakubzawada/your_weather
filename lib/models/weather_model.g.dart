// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherModelImpl _$$WeatherModelImplFromJson(Map<String, dynamic> json) =>
    _$WeatherModelImpl(
      Location.fromJson(json['location'] as Map<String, dynamic>),
      Current.fromJson(json['current'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WeatherModelImplToJson(_$WeatherModelImpl instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
    };

_$CurrentImpl _$$CurrentImplFromJson(Map<String, dynamic> json) =>
    _$CurrentImpl(
      Condition.fromJson(json['condition'] as Map<String, dynamic>),
      json['humidity'] as int,
      json['cloud'] as int,
      (json['temp_c'] as num).toDouble(),
      (json['temp_f'] as num).toDouble(),
      json['is_day'] as int,
      (json['wind_kph'] as num).toDouble(),
      (json['pressure_in'] as num).toDouble(),
      (json['precip_mm'] as num).toDouble(),
      (json['vis_km'] as num).toDouble(),
    );

Map<String, dynamic> _$$CurrentImplToJson(_$CurrentImpl instance) =>
    <String, dynamic>{
      'condition': instance.condition,
      'humidity': instance.humidity,
      'cloud': instance.cloud,
      'temp_c': instance.tempC,
      'temp_f': instance.tempF,
      'is_day': instance.isDay,
      'wind_kph': instance.windKph,
      'pressure_in': instance.pressureIn,
      'precip_mm': instance.precipMm,
      'vis_km': instance.visKm,
    };

_$ConditionImpl _$$ConditionImplFromJson(Map<String, dynamic> json) =>
    _$ConditionImpl(
      json['text'] as String,
      json['icon'] as String,
    );

Map<String, dynamic> _$$ConditionImplToJson(_$ConditionImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'icon': instance.icon,
    };

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      json['name'] as String,
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
