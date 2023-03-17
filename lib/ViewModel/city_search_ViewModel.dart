import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/View/Weather_Display.dart';

class citySearchViewModel with ChangeNotifier{
  late String _cityName;

  String get cityName => _cityName;

  setString(String value){
    _cityName = value;
    notifyListeners();
  }

  searchCity(BuildContext context, String cityName) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => WeatherDisplay(cityName: cityName)));
  }
}