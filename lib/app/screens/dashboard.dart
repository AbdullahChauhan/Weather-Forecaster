import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/app/repositories/data_repository.dart';
import 'package:weather_app/app/screens/widgets/forecast_card.dart';
import 'package:weather_app/app/services/api_service.dart';
import 'package:weather_app/app/utils/app_utils.dart';
import 'package:weather_app/app/models/Forecast.dart';
import 'package:weather_app/app/services/api.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  Forecast _forecast;
  var _latitude;
  var _longitude;

  @override
  void initState() {
    super.initState();
    _updateData();
  }

  Future<void> _updateData() async {
    final dataRepository = Provider.of<DataRepository>(context, listen: false);
    Position position = await _getCurrentLoc();
    _latitude = position.latitude;
    _longitude = position.longitude;
    final forecast = await dataRepository.getForcast(
      latitude: _latitude,
      longitude: _longitude,
      timeInSecs: getCurrentTime()
    );
    setState(() {
      _forecast = forecast;
    });
  }

  Future<Position> _getCurrentLoc() async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Forecast'),
      ),
      body: RefreshIndicator(
        onRefresh: _updateData,
              child: ListView(
          children: <Widget>[
            if(_forecast != null)
            ForecastCard(forecast: _forecast),
          ],
        ),
      ),
    );
  }
}
