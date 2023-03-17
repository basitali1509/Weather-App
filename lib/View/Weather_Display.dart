import 'package:flutter/material.dart';
import 'package:weather_app/Services/stats_services.dart';
import 'package:weather_app/Utils/Reusable_Row.dart';
import 'package:weather_app/View/city_search.dart';
import 'package:weather_app/View/weather_loading_display.dart';
import 'package:weather_app/ViewModel/weather_data.dart';

class WeatherDisplay extends StatefulWidget {
  String cityName;
  WeatherDisplay({Key? key, required this.cityName}) : super(key: key);
  @override
  State<WeatherDisplay> createState() => _WeatherDisplayState();
}

class _WeatherDisplayState extends State<WeatherDisplay> {
  StatsService statsService = StatsService();
  WeatherData weatherData = WeatherData();

  @override
  Widget build(BuildContext context) {
    String city = widget.cityName.toString();

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: statsService.getWeatherApi(city),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const WeatherDataLoadingScreen();
                    } else {
                      Icon icon = weatherData.iconMap[snapshot
                              .data!.list[0].weather[0].icon
                              .toString()] ??
                          const Icon(Icons.error);

                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: snapshot.data!.list[0].sys.pod == 'd'
                                    ? const AssetImage(
                                        'image/weather_image.jpeg')
                                    : const AssetImage('image/night_image.jpg'),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                color: Colors.transparent,
                                child: AppBar(
                                  elevation: 0,
                                  backgroundColor: Colors.transparent,
                                  leading: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const CityListDisplay()));
                                    },
                                    icon: const Icon(
                                      Icons.search,
                                      size: 30,
                                    ),
                                    alignment: Alignment.bottomRight,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    city,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  const SizedBox(height: 30),
                                  Text(
                                    '${snapshot.data!.list[0].main.temp.toInt()}°C',
                                    style: const TextStyle(
                                      fontSize: 55,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        snapshot.data!.list[0].weather[0]
                                            .description
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      const SizedBox(
                                        width: 7,
                                      ),
                                      SizedBox(
                                        height: 35,
                                        width: 35,
                                        child: icon,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    '${snapshot.data!.list[0].main.tempMin.toInt()} / ${snapshot.data!.list[0].main.tempMax.toInt()}',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white70,
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .075,
                                  ),
                                  Column(
                                    children: [
                                      ReusableRow(
                                          title: 'Feels Like',
                                          value:
                                              '${snapshot.data!.list[0].main.feelsLike.toInt()} °C'),
                                      ReusableRow(
                                          title: 'Humidity',
                                          value:
                                              '${snapshot.data!.list[0].main.humidity}%'),
                                      ReusableRow(
                                          title: 'Wind Speed',
                                          value:
                                              '${snapshot.data!.list[0].wind.speed} m/s'),
                                      ReusableRow(
                                          title: 'Wind Direction',
                                          value: weatherData.getWindDirection(
                                              snapshot
                                                  .data!.list[0].main.pressure
                                                  .toDouble())),
                                      ReusableRow(
                                          title: 'Visibility',
                                          value:
                                              '${snapshot.data!.list[0].visibility ~/ 1000} km'),
                                      ReusableRow(
                                          title: 'Chances of Rain',
                                          value:
                                              '${(snapshot.data!.list[0].pop * 100).toInt()}%')
                                    ],
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      );
                    }
                  }),
            ),
          ],
        ));
  }
}
