import 'package:flutter/material.dart';
import 'package:toolbox_app/screens/about_screen.dart';
import 'package:toolbox_app/screens/age/age_prediction_screen.dart';
import 'package:toolbox_app/screens/gender/gender_prediction_screen.dart';
import 'package:toolbox_app/screens/menu_screen.dart';
import 'package:toolbox_app/screens/news_screen.dart';
import 'package:toolbox_app/screens/pokemon_screen.dart';
import 'package:toolbox_app/screens/university/university_list_screen.dart';
import 'package:toolbox_app/screens/weather/weather_screen.dart';

void main() {
  runApp(const ToolboxApp());
}

class ToolboxApp extends StatelessWidget {
  const ToolboxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/toolbox2.png',
                height: 80,
              ),
              const SizedBox(width: 30),
              const Text(
                'Toolbox App',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: const MenuScreen(),
        ),
      ),
      routes: {
        '/gender': (context) => const GenderPredictionScreen(),
        '/age': (context) => const AgePredictionScreen(),
        '/universities': (context) => const UniversityListScreen(),
        '/weather': (context) => const WeatherScreen(),
        '/pokemon': (context) => const PokemonScreen(),
        '/news': (context) => const NewsScreen(),
        '/about': (context) => const AboutScreen(),
      },
    );
  }
}
