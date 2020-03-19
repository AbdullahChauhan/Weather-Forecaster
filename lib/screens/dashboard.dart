import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/services/api.dart';
import 'package:weather_app/services/api_service.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String _timezone;

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
      latitude: 40.7128,
      longitude: -74.0060,
      timeInSecs: currentTimeInSecs
    );
    setState(() => _timezone = forecast.timezone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Forecast'),
      ),
      body: Center(
          child: Text(
        _timezone != null ? _timezone : '',
        style: Theme.of(context).textTheme.headline5,
      )),
    );
  }
}
