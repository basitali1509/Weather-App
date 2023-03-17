import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherData {
  String getWindDirection(double degree) {
    const List<String> directions = [
      'N',
      'NE',
      'E',
      'SE',
      'S',
      'SW',
      'W',
      'NW',
      'N'
    ];
    final int index = ((degree / 45) + 0.5).floor() % 8;
    return directions[index];
  }

  final Map<String, Icon> iconMap = {
    "01d": const Icon(
      Icons.wb_sunny,
      color: Colors.yellow,
      size: 30,
    ),
    "01n": const Icon(
      Icons.nightlight_round,
      color: Colors.white,
      size: 30,
    ),
    "02d": const Icon(
      Icons.cloud,
      color: Colors.white,
      size: 30,
    ),
    "02n": const Icon(
      Icons.cloud,
      color: Colors.white,
      size: 30,
    ),
    "03d": const Icon(
      Icons.cloud,
      color: Colors.white,
      size: 30,
    ),
    "03n": const Icon(
      Icons.cloud,
      color: Colors.white,
      size: 30,
    ),
    '04d': const Icon(Icons.cloud_queue, color: Colors.white, size: 30),
    '04n': const Icon(Icons.cloud_queue, color: Colors.white, size: 30),
    '09d': const Icon(Icons.grain, color: Colors.white, size: 30),
    '09n': const Icon(Icons.grain, color: Colors.white, size: 30),
    '10d': const Icon(WeatherIcons.rain, color: Colors.white, size: 24),
    '10n': const Icon(WeatherIcons.rain_wind, color: Colors.white, size: 18),
    '11d':
        const Icon(WeatherIcons.night_lightning, color: Colors.white, size: 24),
    '11n':
        const Icon(WeatherIcons.night_lightning, color: Colors.white, size: 24),
    '13d': const Icon(WeatherIcons.snow, color: Colors.white, size: 24),
    '13n': const Icon(Icons.ac_unit, color: Colors.white, size: 30),
    '50d': const Icon(Icons.blur_on, color: Colors.white, size: 30),
    '50n': const Icon(Icons.blur_on, color: Colors.white, size: 30),
    // Add more mappings here
  };
}
