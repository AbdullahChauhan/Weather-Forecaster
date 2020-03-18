// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Forecast _$ForecastFromJson(Map<String, dynamic> json) {
  return Forecast(
    (json['latitude'] as num)?.toDouble(),
    (json['longitude'] as num)?.toDouble(),
    json['timezone'] as String,
    json['currently'] as Map<String, dynamic>,
    json['minutely'] as Map<String, dynamic>,
    json['hourly'] as Map<String, dynamic>,
    json['daily'] as Map<String, dynamic>,
    json['flags'] as Map<String, dynamic>,
    json['offset'] as int,
  );
}

Map<String, dynamic> _$ForecastToJson(Forecast instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'timezone': instance.timezone,
      'currently': instance.currently,
      'minutely': instance.minutely,
      'hourly': instance.hourly,
      'daily': instance.daily,
      'flags': instance.flags,
      'offset': instance.offset,
    };
