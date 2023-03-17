import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/Model/WeatherModelClass.dart';
import 'package:weather_app/Services/Utilities/api_url.dart';

class StatsService {
  Future<WeatherModelClass> getWeatherApi(String? location) async {
    String finalLocation = location!.toLowerCase();
    final response =
        await http.get(Uri.parse(ApiURL().getLocation(finalLocation)));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      return WeatherModelClass.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }
}
