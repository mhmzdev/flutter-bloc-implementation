import 'package:bloc_app/screens/weather/cubit/cubit/weather_cubit.dart';
import 'package:bloc_app/screens/weather/views/weather_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'configs/core_theme.dart' as theme;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const AppView());
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This is the traditional way of handling cubit/providers (if any)
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WeatherCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Bloc Implementation',
        theme: theme.themeLight,
        home: const WeatherView(),
      ),
    );
  }
}
