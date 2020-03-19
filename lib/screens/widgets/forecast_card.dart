import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/Forecast.dart';

class ForecastCard extends StatelessWidget {
  final Forecast forecast;

  const ForecastCard({Key key, this.forecast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '${forecast.timezone}',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    '${forecast.currently['temperature']}°F',
                    style: Theme.of(context).textTheme.headline5,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '${DateFormat.yMMMMEEEEd().format(DateTime.fromMillisecondsSinceEpoch(forecast.currently['time'] * 1000))}',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Spacer(),
                  Text(
                    '${forecast.currently['summary']}',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  SizedBox(
                    width: 2.0,
                  ),
                  Icon(
                    Icons.assessment,
                    size: 16.0,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
