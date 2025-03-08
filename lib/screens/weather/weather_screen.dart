import 'package:flutter/material.dart';
import 'package:toolbox_app/screens/weather/weather_result.dart';

import '../../models/weather_model.dart';
import '../../services/weather/weather_service.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherModel? _weather;
  bool _isLoading = false;

  Future<void> _fetchWeather() async {
    setState(() => _isLoading = true);
    final data = await WeatherService.getWeather();
    setState(() {
      _weather = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Clima en RD',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _weather != null
            ? WeatherResult(weather: _weather!)
            : const Center(
          child: Text(
                      'No se pudo obtener el clima',
                      style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
