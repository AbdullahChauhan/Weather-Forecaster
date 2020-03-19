import 'package:flutter/foundation.dart';
import 'package:weather_app/services/api_keys.dart';

class API {
  final String apiKey;

  API({@required this.apiKey});

  factory API.sandbox() => API(apiKey: APIKeys.darkSkyKey);

  static final String host = "api.darksky.net";
  static final String basePath = "forecast";

  Uri forcastCallUri({@required String key, @required double latitude, @required double longitude, @required int timeInSecs}) => Uri(
    scheme: "https",
    host: host,
    path: '$basePath/$key/$latitude,$longitude,$timeInSecs',
    queryParameters: {
      "units": "auto",
    },
  );
}