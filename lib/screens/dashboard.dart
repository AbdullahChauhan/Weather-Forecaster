import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/Forecast.dart';
import 'package:weather_app/screens/widgets/forecast_card.dart';
import 'package:weather_app/services/api.dart';
import 'package:weather_app/services/api_service.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  Forecast _forecast;

  @override
  void initState() {
    super.initState();
    _updateData();
  }

  Future<void> _updateData() async {
    final dataRepository = Provider.of<APIService>(context, listen: false);
    DateTime time = DateTime.now();
    int ms = time.millisecondsSinceEpoch;
    int currentTimeInSecs = (ms / 1000).round();
    print(currentTimeInSecs);
    final forecast = await dataRepository.getForcast(
      key: API.sandbox().apiKey,
      latitude: 42.3601,
      longitude: -71.0589,
      timeInSecs: currentTimeInSecs
    );
    setState(() {
      _forecast = forecast;
    });
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
            ForecastCard(forecast: _forecast)
          ],
        ),
      ),
    );
  }
}
