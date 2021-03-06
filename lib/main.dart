import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/app/repositories/data_repository.dart';
import 'package:weather_app/app/screens/dashboard.dart';
import 'package:weather_app/app/services/api.dart';
import 'package:weather_app/app/services/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<DataRepository>(
      create: (_) => DataRepository(apiService: APIService(api: API.sandbox())),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Weather Forecaster',
          theme: ThemeData(
              brightness: Brightness.dark,
              scaffoldBackgroundColor: Color(0xFF101010),
              cardColor: Color(0xFF222222)),
          home: Dashboard()),
    );
  }
}
