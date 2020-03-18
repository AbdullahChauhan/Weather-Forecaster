import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:weather_app/models/Forecast.dart';
import 'package:weather_app/services/api.dart';

class APIService {
  final API api;

  APIService({@required this.api});

  Future<Forecast> getForcast(
      {@required String key,
      @required double latitude,
      @required double longitude}) async {
    final uri =
        api.forcastCallUri(key: key, latitude: latitude, longitude: longitude);
    final response = await http.get(
      uri.toString(),
    );

    try {
      if (response.statusCode == 200) {
        Forecast forecast = Forecast.fromJson(json.decode(response.body));
        return forecast;
      }
    } on Response catch (response) {
      if (response.statusCode == 401) {
        print(
            'Request ${api.forcastCallUri(key: key, latitude: latitude, longitude: longitude)} failed\nResponse: ${response.statusCode} ${response.reasonPhrase}');
      }
    }
    throw response;
  }
}
