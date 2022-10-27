import 'package:bloc_app/extensions/weather_ext.dart';
import 'package:bloc_app/screens/weather/models/models.dart';
import 'package:flutter/material.dart';

class WeatherSuccessView extends StatelessWidget {
  final Weather weather;
  final TemperatureUnits units;
  const WeatherSuccessView({
    Key? key,
    required this.weather,
    required this.units,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          weather.location,
          style: Theme.of(context).textTheme.headline2?.copyWith(
                fontWeight: FontWeight.w200,
              ),
        ),
        Text(
          weather.formattedTemperature(units),
          style: Theme.of(context).textTheme.headline3?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          '''Last Updated at ${TimeOfDay.fromDateTime(weather.lastUpdated).format(context)}''',
        ),
      ],
    );
  }
}
