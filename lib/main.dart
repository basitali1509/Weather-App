import 'package:flutter/material.dart';
import 'package:weather_app/View/Main_Screen.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/ViewModel/city_search_ViewModel.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => citySearchViewModel())
    ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Weather',
          theme: ThemeData(
            brightness: Brightness.dark,
          ),
          home: const MainScreen()
      ),
    );
  }
}

