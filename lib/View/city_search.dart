import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Services/stats_services.dart';
import 'package:weather_app/Utils/flushbar.dart';
import 'package:weather_app/ViewModel/city_search_ViewModel.dart';

class CityListDisplay extends StatefulWidget {
  const CityListDisplay({Key? key}) : super(key: key);

  @override
  State<CityListDisplay> createState() => _CityListDisplayState();
}

class _CityListDisplayState extends State<CityListDisplay> {
  StatsService statsService = StatsService();
  TextEditingController textEditingController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final citySearch = Provider.of<citySearchViewModel>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(15),
              child: Consumer<citySearchViewModel>(
                builder: (context, value, child) {
                  return TextFormField(
                    onChanged: (val) {
                      citySearch.setString(val);
                    },
                    focusNode: searchFocusNode,
                    onFieldSubmitted: (value) {
                      final name = textEditingController.text;
                      if (name == null || name.isEmpty) {
                        flushBar.showFlushBar(context, 'Search bar is empty',
                            'Enter any city name');
                      } else {
                        citySearch.searchCity(context, value);
                      }
                    },
                    controller: textEditingController,
                    decoration: InputDecoration(
                        suffixIcon: InkWell(
                            onTap: () {
                              final name = textEditingController.text;
                              if (name == null || name.isEmpty) {
                                flushBar.showFlushBar(
                                    context,
                                    'Search bar is empty',
                                    'Enter any city name');
                              } else {
                                citySearch.searchCity(context, name);
                              }
                            },
                            child: const Icon(Icons.search)),
                        hintText: 'Search City',
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 25),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        )),
                  );
                },
              )),
        ],
      )),
    );
  }
}
