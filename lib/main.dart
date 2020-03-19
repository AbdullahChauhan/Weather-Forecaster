import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/app/screens/dashboard.dart';
import 'package:weather_app/app/services/api.dart';
import 'package:weather_app/services/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<APIService>(
      create: (_) => APIService(api: API.sandbox()),
          child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Weather Forecaster',
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Color(0xFF101010),
          cardColor: Color(0xFF222222)
          ),
          home: Dashboard()),
    );
  }
}
