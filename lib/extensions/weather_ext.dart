import 'package:bloc_app/screens/weather/models/models.dart';
import 'temperature_ext.dart';

extension WeatherFormat on Weather {
  String formattedTemperature(TemperatureUnits units) {
    return '''${temperature.value.toStringAsPrecision(2)}°${units.isCelsius ? 'C' : 'F'}''';
  }
}
