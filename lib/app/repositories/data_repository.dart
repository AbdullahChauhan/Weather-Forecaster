import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:weather_app/app/models/Forecast.dart';
import 'package:weather_app/app/services/api.dart';
import 'package:weather_app/app/services/api_service.dart';

class DataRepository {
  final APIService apiService;

  DataRepository({@required this.apiService});

  Future<Forecast> getForcast(
      {@required double latitude,
      @required double longitude,
      @required int timeInSecs}) async {
    try {
      final data = await apiService.getForcast(
          key: API.sandbox().apiKey,
          latitude: latitude,
          longitude: longitude,
          timeInSecs: timeInSecs);
      return data;
    } on Response catch (response) {
      // something else
      print(response);
      rethrow;
    }
  }
}
