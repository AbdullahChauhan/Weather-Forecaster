import 'package:json_annotation/json_annotation.dart';

/// This allows the `Forecast` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'Forecast.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()

class Forecast {
  final double latitude;
  final double longitude;
  final String timezone;
  final Map<String, dynamic> currently;
  final Map<String, dynamic> minutely;
  final Map<String, dynamic> hourly;
  final Map<String, dynamic> daily;
  final Map<String, dynamic> flags;
  final int offset;

  Forecast(this.latitude, this.longitude, this.timezone, this.currently, this.minutely, this.hourly, this.daily, this.flags, this.offset);

  /// A necessary factory constructor for creating a new Forecast instance
  /// from a map. Pass the map to the generated `_$ForecastFromJson()` constructor.
  /// The constructor is named after the source class, in this case, Forecast.
  factory Forecast.fromJson(Map<String, dynamic> json) => _$ForecastFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$ForecastToJson`.
  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}