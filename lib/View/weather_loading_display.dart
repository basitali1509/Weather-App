import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app/Utils/Reusable_Row.dart';


class WeatherDataLoadingScreen extends StatefulWidget {
  const WeatherDataLoadingScreen({Key? key}) : super(key: key);

  @override
  State<WeatherDataLoadingScreen> createState() =>
      _WeatherDataLoadingScreenState();
}

class _WeatherDataLoadingScreenState extends State<WeatherDataLoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('image/night_image.jpg'),
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
              ),
            ),
            Column(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade700,
                  highlightColor: Colors.grey.shade100,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        height: 8,
                        width: 100,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 40),
                      Container(
                        height: 12,
                        width: 130,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 45),
                      Container(
                        height: 7,
                        width: 150,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 6,
                        width: 120,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .137,
                ),
                Column(
                  children: const [
                    ReusableRow(title: 'Feels Like', value: ' °C'),
                    ReusableRow(title: 'Humidity', value: ' %'),
                    ReusableRow(title: 'Wind Speed', value: ' m/s'),
                    ReusableRow(
                      title: 'Wind Direction',
                      value: ' ',
                    ),
                    ReusableRow(title: 'Visibility', value: ' km'),
                    ReusableRow(title: 'Chances of Rain', value: ' %')
                  ],
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
