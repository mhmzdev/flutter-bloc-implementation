import 'package:weather_api/weather_api.dart' hide Weather;
import 'package:weather_repository/weather_repository.dart';

class WeatherRepository {
  WeatherRepository({WeatherDataProvider? dataProvider})
      : _dataProvider = dataProvider ?? WeatherDataProvider();

  final WeatherDataProvider _dataProvider;

  Future<Weather> getWeather(String city) async {
    final location = await _dataProvider.getLocation(city);
    final weather =
        await _dataProvider.getWeather(location.latitude, location.longitude);

    return Weather(
      location: location.name,
      temp: weather.temp,
    );
  }
}
