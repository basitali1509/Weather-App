import 'package:flutter/material.dart';
import 'package:weather_app/View/Weather_Display.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
    Widget build(BuildContext context) {

      return WeatherDisplay(cityName: 'Karachi');
    }
}
