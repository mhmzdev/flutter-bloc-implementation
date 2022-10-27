import 'package:bloc/bloc.dart';
import 'package:bloc_app/screens/weather/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_repository/weather_repository.dart' hide Weather;
import 'package:weather_repository/weather_repository.dart'
    show WeatherRepository;

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(const WeatherInitial());

  // final WeatherRepository _repository;
  final repo = WeatherRepository();

  Future<void> fetch(String city) async {
    emit(const WeatherLoading());

    try {
      final data = await repo.getWeather(city);
      final weather = Weather.fromRepository(data);

      emit(
        WeatherSuccess(
          weather: weather,
          temperatureUnits: TemperatureUnits.celius,
        ),
      );
    } catch (e) {
      emit(WeatherFailed(message: e.toString()));
    }
  }

  Future<void> refresh() async {
    try {
      final data = await repo.getWeather(
        state.weather?.location ?? 'New York',
      );

      final weather = Weather.fromRepository(data);

      emit(
        WeatherSuccess(
          weather: weather,
          temperatureUnits: TemperatureUnits.celius,
        ),
      );
    } catch (e) {
      emit(WeatherFailed(message: e.toString()));
    }
  }
}
